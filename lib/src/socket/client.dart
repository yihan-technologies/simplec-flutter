// import 'dart:io';
// import 'dart:convert';
import 'dart:async';
import 'package:websocket_universal/websocket_universal.dart';
import '../logger/logger.dart';

class Client {
  List<String> urls = [];
  Map<String, String> data = <String, String>{};
  late IWebSocketHandler<List<int>, List<int>> ws;
  int pingTimeout = 3000;
  late Timer pinger;
  late Timer reConnectTimeout;
  int reconnectInterval = 4000;
  int updatedReconnectInterval = 0;
  int pingInterval = 5000;
  bool goodClose = false;
  int currentServerIndex = 0;
  List<List<int>> pending = [];
  Function(List<int>) handler;
  Logger log;
  bool initialConnected = false;

  Client(this.urls, this.data, this.pingInterval, this.reconnectInterval,
      this.handler, this.log) {
    var connectionOptions = SocketConnectionOptions(
      pingIntervalMs: pingInterval, // send Ping message every 3000 ms
      timeoutConnectionMs:
          reconnectInterval, // connection fail timeout after 4000 ms
      /// see ping/pong messages in [logEventStream] stream
      skipPingMessages: false,
    );

    final IMessageProcessor<List<int>, List<int>> bytesSocketProcessor =
        SocketSimpleBytesProcessor();

    ws = IWebSocketHandler<List<int>, List<int>>.createClient(
      getURL(), // Local ws server
      bytesSocketProcessor,
      connectionOptions: connectionOptions,
    );

    //connect();
  }

  String getURL() {
    //currentServerIndex = (DateTime.now().millisecondsSinceEpoch / 1000).floor() % urls.length;

    String url = (urls..shuffle()).first;

    List<String> keys = data.keys.toList();

    if (keys.isNotEmpty) {
      url = '$url?';
      for (int index = 0; index < keys.length; index++) {
        String key = keys[index];
        if (index != 0) {
          url = '$url&';
        }
        url = '$url$key=${data[key]}';
      }
    }
    return url;
  }

  Future<bool> connect() async {
    if (ws.socketState.status == SocketStatus.connected ||
        ws.socketState.status == SocketStatus.connecting) {
      return true;
    }

    //print("URL: $url");
    //ws = WebSocket.connect(url);

    currentServerIndex = currentServerIndex + 1;

    if (currentServerIndex >= urls.length) currentServerIndex = 0;

    ws.logEventStream.listen((debugEvent) {
      // ignore: avoid_print

      switch (debugEvent.socketLogEventType) {
        case SocketLogEventType.error:
          log
              .error()
              .interface("SOCKET STATUS", debugEvent.status.toString())
              .err(debugEvent.message)
              .interface("STRING", debugEvent.toString())
              .msg("error.log.event.socket");
          break;
        case SocketLogEventType.warning:
          log
              .warn()
              .interface("SOCKET STATUS", debugEvent.status.toString())
              .err(debugEvent.message)
              .interface("STRING", debugEvent.toString())
              .msg("warn.log.event.socket");
          break;
        case SocketLogEventType.socketStateChanged:
          log
              .info()
              .interface("SOCKET STATUS", debugEvent.status.toString())
              .err(debugEvent.message)
              .interface("STRING", debugEvent.toString())
              .msg("state.change.log.event.socket");
          break;
        default:
          log
              .info()
              .interface("SOCKET STATUS", debugEvent.status.toString())
              .err(debugEvent.message)
              .interface("EVENT TYPE", debugEvent.socketLogEventType.value)
              .interface("STRING", debugEvent.toString())
              .msg("state.change.log.event.socket");
      }

      // print('> debug event: ${debugEvent.socketLogEventType}'
      //     ' ping=${debugEvent.pingMs} ms. Debug message=${debugEvent.message}');
    });

    ws.incomingMessagesStream.listen(handler, onError: (err) {
      log.error().err(err).msg("log.debug.event.incoming.socket");
    });

    // ws.outgoingMessagesStream.listen((inMsg) {
    //   // ignore: avoid_print
    //   log.debug().datta(inMsg).msg("log.debug.event.outgoing.socket");
    // });

    // ws.socketHandlerStateStream.listen((event) {
    //   switch (event.status) {
    //     case SocketStatus.disconnected:
    //       log.error().datta(event).msg("log.listen.state.disconnected.socket");
    //       reConnect();
    //       break;
    //     default:
    //       log.info().datta(event).msg("log.listen.state.socket");
    //   }
    // });

    var connected = await ws.connect();
    if (connected) initialConnected = true;

    //runPinger();

    if (pending.isNotEmpty) {
      var dontClear = false;

      for (var ele in pending) {
        var status = send(ele);
        if (!status) {
          dontClear = true;
          break;
        }
      }

      if (!dontClear) pending = [];
    }

    return connected;
  }

  void reConnect() {
    if (!goodClose &&
        ws.socketHandlerState.status == SocketStatus.disconnected) {
      log.info().datta("reconnecting").msg("reconnecting.client.socket");
      if (!reConnectTimeout.isActive) {
        if (updatedReconnectInterval == 0) {
          updatedReconnectInterval = reconnectInterval;
        } else {
          updatedReconnectInterval = updatedReconnectInterval * 2;
        }

        updatedReconnectInterval =
            updatedReconnectInterval > 20000 ? 20000 : updatedReconnectInterval;

        var dur = Duration(
            milliseconds: updatedReconnectInterval > 20000
                ? 20000
                : updatedReconnectInterval);

        reConnectTimeout = Timer(dur, () async {
          var con = await connect();
          if (con) {
            reConnectTimeout.cancel();
            updatedReconnectInterval = 0;
          } else {
            reConnect();
          }
        });
      }
    } else {
      reConnectTimeout.cancel();
      updatedReconnectInterval = 0;
    }
  }

  // void keepAlive() {
  //   if (this.pingInterval > 0 && this.pingTimeout == null) {
  //     this.pingTimeout = Timer(Duration(milliseconds: this.pingInterval), () {
  //       if (this.ws != null && this.ws.readyState == WebSocket.open) {
  //         print("SEND PING: ${this.pingInterval}");
  //         print("ws data: ${this.ws.extensions} : ${this.ws.protocol}");
  //         this.ws.add('');
  //       }
  //       this.pingTimeout = null;
  //       this.keepAlive();
  //     });
  //   }
  // }

  void close() {
    goodClose = true;
    pingInterval = 0;
    // if (this.pingTimeout != 0) {
    //   this.pingTimeout.cancel();
    // }
    // if (this.reConnectTimeout != null) {
    //   this.reConnectTimeout.cancel();
    // }
    ws.close();
  }

  void runPinger() {
    var interval = pingInterval;

    if (pinger.isActive) pinger.cancel();

    if (ws.socketState.status == SocketStatus.connected) {
      send([]);
    } else {
      interval = 4000;
    }

    pinger = Timer(Duration(milliseconds: interval), () => runPinger());
  }

  bool send(List<int> data) {
    if (!initialConnected || ws.socketState.status != SocketStatus.connected) {
      addToPending(data);
      return false;
    }

    return ws.sendMessage(data);
  }

  void addToPending(List<int> data) {
    pending.add(data);
  }
}
