import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simplec_flutter/simplec_flutter.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.setMockInitialValues({});
  test('adds one to input values', () async {
    final sc = Simplec(
        ["ws://127.0.0.1:9061"], "1", "0", "test", {}, "flutter-test", 3);

    var ts = "test";
    var tsCode = ts.codeUnits;

    sc.runner.addMultipleHandler("test", (ts) {
      sc.log.debug().msg("event");
      expect(tsCode[0], ts.dATA[0]);
    });

    await sc.runner.run();

    final connected = await sc.runner.connect();

    expect(connected, true);

    if (!connected) return;

    sc.runner.addEventHandler("test", "test", (ts) {
      sc.log.debug().msg("event.test");
      expect(tsCode[0], ts.dATA[0]);
    });

    var sent = sc.runner.sendDynamic("realtime.m", "test", ts);
    expect(sent, true);

    sent = sc.runner.sendDynamic("logic.m", "test", ts);
    expect(sent, true);

    await Future<void>.delayed(const Duration(seconds: 10));
  });
}
