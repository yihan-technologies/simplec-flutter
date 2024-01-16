import 'package:flutter_test/flutter_test.dart';

import 'package:simplec_flutter/src/stateManager/StateManager.dart';
import 'package:simplec_flutter/src/logger/logger.dart';

void main() {
  test('adds values and check the saved value', () {
    final state = StateManger();

    final log = Logger(level: 3, service: "test");

    state.addField("test", "tester", 1);
    state.addAction("test", "tester", "testing", (p0, p1) {
      return p1;
    });
    state.addFieldIfItDoeaNotExist("", "yinka", "2");

    state.setUpdateFieldListener("test", "tester", "testing", (data) {
      log.info().datta(data).msg("testing listener");
    });

    var err = state.update("test", "tester", "testing", 100);
    if (err != null && err != "") {
      log.error().datta(err).msg("check.error.update");
    }

    log.info().datta(state.getField("test", "")).msg("test");

    expect(state.getField("test", "tester"), 100);
    expect(state.getField("", "yinka"), "2");
  });
}
