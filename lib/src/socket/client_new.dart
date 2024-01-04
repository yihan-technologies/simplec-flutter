import 'dart:convert';

import 'package:websocket_universal/websocket_universal.dart';

/// Bytes array example:
void main() async {
  /// For getting/answering byte-array messages (`List<int> in dart`)
  /// you will need your own server and handle messages as byte-arrays
  /// on the backend side too. On client side it will look like this:
  const websocketLocalExample = 'ws://127.0.0.1:42627/websocket';
  const textMessageToServer = 'Hello server!';
  const connectionOptions = SocketConnectionOptions(
    pingIntervalMs: 3000, // send Ping message every 3000 ms
    timeoutConnectionMs: 4000, // connection fail timeout after 4000 ms
    /// see ping/pong messages in [logEventStream] stream
    skipPingMessages: false,
  );

  final IMessageProcessor<List<int>, List<int>> bytesSocketProcessor =
      SocketSimpleBytesProcessor();
  final bytesSocketHandler =
      IWebSocketHandler<List<int>, List<int>>.createClient(
    websocketLocalExample, // Local ws server
    bytesSocketProcessor,
    connectionOptions: connectionOptions,
  );

  // Listening to debug events inside webSocket
  bytesSocketHandler.logEventStream.listen((debugEvent) {
    // ignore: avoid_print
    print('> debug event: ${debugEvent.socketLogEventType}'
        ' ping=${debugEvent.pingMs} ms. Debug message=${debugEvent.message}');
  });

  // Listening to server responses:
  bytesSocketHandler.incomingMessagesStream.listen((inMsg) {
    // ignore: avoid_print
    print('> webSocket  got bytes message from server: "$inMsg"');
  });

  // Listening to outgoing messages:
  bytesSocketHandler.outgoingMessagesStream.listen((inMsg) {
    // ignore: avoid_print
    print('> webSocket sent bytes message to   server: "$inMsg"');
  });

  // Connecting to server:
  final isBytesSocketConnected = await bytesSocketHandler.connect();
  if (!isBytesSocketConnected) {
    // ignore: avoid_print
    print('Connection to [$websocketLocalExample] for bytesSocketHandler '
        'failed for some reason!');
    return;
  }
  final bytesMessage = utf8.encode(textMessageToServer);
  //textMessageToServer
  bytesSocketHandler.sendMessage(bytesMessage);

  await Future<void>.delayed(const Duration(seconds: 7));
  // Disconnecting from server:
  await bytesSocketHandler.disconnect('manual disconnect');

  // Disposing webSocket:
  bytesSocketHandler.close();
}
