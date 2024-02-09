import 'package:websocket_universal/websocket_universal.dart';
import 'dart:convert';

import 'client.dart';
import '../../storage.dart';
import '../proto/public.pb.dart';
import '../logger/logger.dart';

class SeqEventRunner {
  List<dynamic Function(dynamic)> seq = [];
  late dynamic Function(TransferSingle) init;

  SeqEventRunner() {
    seq = [];
  }

  void runSeq(dynamic data) {
    if (seq.isNotEmpty) {
      var res = init(data);
      for (var i = 0; i < seq.length; i++) {
        res = seq[i](res);
      }
    }
  }
}

class EventRunner {
  late SeqEventRunner seq;
  List<void Function(TransferSingle)> callbacks = [];
  List<void Function(Transfer)> callbacksSingle = [];
  Map<String, Function(TransferSingle)> subEventRunners = {};

  EventRunner() {
    seq = SeqEventRunner();
  }
}

class Runner {
  List<String> urls;
  Map<String, String> data;
  late Client client;
  late Logger logger;
  Map<String, EventRunner> runners = {};

  Runner(this.urls, this.data, this.logger) {
    runners = {};
  }

  run() async {
    data['instanceId'] = await getData<String>('instanceId');
    var token = await getData<String?>('token');
    if (token != null && token != "") data['token'] = token;
    var session = await getData<String?>('session');
    if (session != null && session != "") data['session'] = session;
    var conId = await getData<String?>('conId');
    if (conId != null && conId != "") data['conId'] = conId;
  }

  Future<bool> connect() {
    client = Client(urls, data, 30000, 5000, (ev) {
      processData(ev);
    }, logger);

    return client.connect();
  }

  Future<void> processData(List<int> data) async {
    var trans = Transfer.fromBuffer(data);

    if (trans.iNS == 'realtime.s.s.m') {
      for (var i = 0; i < trans.oBJS.length; i++) {
        var ele = trans.oBJS[i];

        var runner = runners[ele.iNS];

        if (runner == null) {
          var raw = logger
              .error()
              .interface("instruction", trans.iNS)
              .getMsg("2.no.runner.invalid.instruction.single.socket");
          sendLog(raw);
          return;
        }

        for (var ind = 0; ind < runner.callbacks.length; ind++) {
          var callback = runner.callbacks[ind];
          callback(ele);
        }

        runner.seq.runSeq(ele);
      }
    } else if (trans.iNS.startsWith('realtime.s.s.s')) {
      var runner = runners[trans.iNS];

      if (runner == null) {
        var raw = logger
            .error()
            .interface("instruction", trans.iNS)
            .getMsg(".no.runner.invalid.instruction.socket");
        sendLog(raw);
        return;
      }

      for (var i = 0; i < runner.callbacksSingle.length; i++) {
        var ele = runner.callbacksSingle[i];
        ele(trans);
      }
    } else if (trans.iNS.startsWith('realtime.s.e')) {
      var event = trans.cRED["event"];

      var runner = runners[event];

      if (runner == null) {
        var raw = logger
            .error()
            .interface("instruction", trans.iNS)
            .getMsg(".no.runner.invalid.event.socket");
        sendLog(raw);
        return;
      }

      for (var ele in trans.oBJS) {
        var sub = runner.subEventRunners[ele.iNS];

        if (sub == null) {
          var raw = logger
              .error()
              .interface("instruction", ele.iNS)
              .getMsg("no,sub.event.runner.event.socket");
          sendLog(raw);
          continue;
        }

        sub(ele);
      }
    } else {
      var raw = logger
          .error()
          .interface("instruction", trans.iNS)
          .getMsg("invalid.instruction.socket");
      sendLog(raw);
    }
  }

  void checkRunner(String key) {
    if (!runners.containsKey(key)) {
      var runner = EventRunner();
      runners[key] = runner;
    }
  }

  void addSingleHandler(String key, void Function(Transfer) handler) {
    checkRunner(key);
    runners[key]?.callbacksSingle.add(handler);
  }

  void removeSingleHandler(String key, int hash) {
    checkRunner(key);
    var callbacks = runners[key]?.callbacksSingle;
    if (callbacks == null) return;
    var index = -1;
    for (var i = 0; i < callbacks.length; i++) {
      if (callbacks[i].hashCode == hash) {
        index = i;
        break;
      }
    }
    if (index > -1) {
      runners[key]?.callbacksSingle.removeAt(index);
    }
  }

  bool addEventHandler(
      String event, String subEvent, void Function(TransferSingle) handler) {
    checkRunner(event);

    runners[event]?.subEventRunners[subEvent] = handler;

    return sendRaw("realtime.m", "event.subscribe", event.codeUnits);
  }

  void removeEventSubHandler(String event, String subEvent) {
    checkRunner(event);

    runners[event]?.subEventRunners.remove(subEvent);

    //return sendDynamic("realtime.m", "event.subscribe", event.codeUnits);
  }

  bool removeEventHandler(String event) {
    checkRunner(event);
    var ret = sendDynamic("realtime.m", "event.unsubscribe", event.codeUnits);
    runners[event]?.subEventRunners = {};
    return ret;
  }

  void resetHandler(String key) {
    runners.remove(key);
  }

  void addMultipleHandler(String key, void Function(TransferSingle) handler) {
    checkRunner(key);
    runners[key]?.callbacks.add(handler);
  }

  void removeMultipleHandler(String key, int hash) {
    checkRunner(key);
    var callbacks = runners[key]?.callbacks;
    if (callbacks == null) return;
    var index = -1;
    for (var i = 0; i < callbacks.length; i++) {
      if (callbacks[i].hashCode == hash) {
        index = i;
        break;
      }
    }
    if (index > -1) {
      runners[key]?.callbacks.removeAt(index);
    }
  }

  void addSequenceHandler(
      String key, dynamic Function(TransferSingle) handler) {
    checkRunner(key);
    runners[key]?.seq.init = handler;
  }

  void addSequenceHandle(
      String key, int index, dynamic Function(dynamic) handler) {
    checkRunner(key);
    runners[key]?.seq.seq[index] = handler;
  }

  bool sendData(Transfer data) {
    var raw = data.writeToBuffer();
    if (client.ws.socketState.status != SocketStatus.connected) {
      client.addToPending(raw);
      return false;
    }
    return client.ws.sendMessage(raw);
  }

  void sendLog(String data) {
    var single = TransferSingle(dATA: data.codeUnits, iNS: "logger.log");
    var trans = Transfer(iNS: "realtime.m", oBJS: [single]);

    sendData(trans);
  }

  bool sendDynamic(String transIns, String singleIns, dynamic dat) {
    var encoded = json.encode(dat);
    var single = TransferSingle(dATA: encoded.codeUnits, iNS: singleIns);
    var trans = Transfer(iNS: transIns, oBJS: [single]);

    return sendData(trans);
  }

  bool sendRaw(String transIns, String singleIns, List<int> data) {
    var single = TransferSingle(dATA: data, iNS: singleIns);
    var trans = Transfer(iNS: transIns, oBJS: [single]);

    return sendData(trans);
  }

  void disconnect() {
    client.ws.close();
  }
}
