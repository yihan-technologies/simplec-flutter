import 'package:websocket_universal/websocket_universal.dart';
import 'dart:convert';

import 'client.dart';
import '../storage.dart';
import '../proto/public.pb.dart';
import '../logger/logger.dart';

class SeqEventRunner {
  List<dynamic Function(TransferSingle)> seq = [];
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

  EventRunner() {
    seq = SeqEventRunner();
    callbacks = [];
    callbacksSingle = [];
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
      if (runner != null) {
        for (var i = 0; i < runner.callbacksSingle.length; i++) {
          var ele = runner.callbacksSingle[i];
          ele(trans);
        }
      } else {
        var raw = logger
            .error()
            .interface("instruction", trans.iNS)
            .getMsg(".no.runner.invalid.instruction.socket");
        sendLog(raw);
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
    var runner = runners[key];
    if (runner == null) return;
    runner.callbacksSingle.add(handler);
    runners[key] = runner;
  }

  void resetHandler(String key) {
    runners.remove(key);
  }

  void addMultipleHandler(String key, void Function(TransferSingle) handler) {
    checkRunner(key);
    var runner = runners[key];
    if (runner == null) return;
    runner.callbacks.add(handler);
    runners[key] = runner;
  }

  void addSequenceHandler(
      String key, dynamic Function(TransferSingle) handler) {
    checkRunner(key);
    var runner = runners[key];
    if (runner == null) return;
    runner.seq.init = handler;
    runners[key] = runner;
  }

  void addSequenceHandle(
      String key, int index, dynamic Function(dynamic) handler) {
    checkRunner(key);
    var runner = runners[key];
    if (runner == null) return;
    runner.seq.seq[index] = handler;
    runners[key] = runner;
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

  void disconnect() {
    client.ws.close();
  }
}
