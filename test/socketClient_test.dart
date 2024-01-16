import 'package:flutter_test/flutter_test.dart';

import 'package:simplec_flutter/src/socket/client.dart';
import 'package:simplec_flutter/src/logger/logger.dart';

void main() {
  test('adds values and check the saved value', () async {
    final log = Logger(level: 3, service: "test");

    var hello = "HELLO";
    var helloCode = hello.codeUnits;

    var world = "WORLD";
    var worldCode = world.codeUnits;

    var servers = ["ws://127.0.0.1:50090"];
    //var servers = ["wss://ws.postman-echo.com/raw"];

    final client = Client(servers, {"instanceId": "test"}, 5000, 10000, (data) {
      log
          .info()
          .datta(data)
          .interface("expected", worldCode)
          .msg("message.received.socket");

      if (data[0] != worldCode[0]) {
        log
            .error()
            .interface("expected", world[0])
            .interface("got", data[0])
            .msg("failed.response.recieved.socket");
      }

      expect(data[0], worldCode[0]);
    }, log);

    var success = await client.connect();

    expect(success, true);

    var sent = client.send(helloCode);

    expect(sent, true);

    await Future<void>.delayed(const Duration(seconds: 10));

    client.close();

    await Future<void>.delayed(const Duration(seconds: 5));
  });
}
