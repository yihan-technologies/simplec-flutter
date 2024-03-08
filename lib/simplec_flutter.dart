library simplec_flutter;

import 'dart:convert';
import './src/stateManager/StateManager.dart';
import './src/socket/runner.dart';
import './src/proto/public.pb.dart';
import './src/logger/logger.dart';
import 'storage.dart';

class Simplec {
  late StateManger stateManager;
  late Runner runner;
  late Logger log;
  List<String> urls;
  String orgId;
  String tempId;
  String rootPlugin;
  Map<String, String> data;
  String service;
  int logLevel;

  Simplec(this.urls, this.orgId, this.tempId, this.rootPlugin, this.data,
      this.service, this.logLevel) {
    stateManager = StateManger();
    stateManager.addFieldIfItDoeaNotExist("Main", "Notifications", []);

    stateManager.addAction("Main", "Notifications", "change", (_, val) {
      return val;
    });

    var da = {"ORGID": orgId, "tempId": tempId, "rootPlugin": rootPlugin};
    data.forEach((key, val) {
      da[key] = val;
    });

    log = Logger(level: logLevel, service: service);

    runner = Runner(urls, da, log);

    runner.addMultipleHandler("state.change", (TransferSingle ts) {
      try {
        if (ts.eRR == "") {
          var c = ChangeState.fromBuffer(ts.dATA);
          var val = json.decode(c.value);
          stateManager.addFieldIfItDoeaNotExist(c.comp, c.field_2, val);
          var err = stateManager.update(c.comp, c.field_2, c.action, val);
          if (err != "") {
            stateManager.update("Main", "Notifications", "change", [
              {"Type": "error", "Value": err, "TimeOut": 7000}
            ]);
            //print("decode json value error: $err : ${c.Value}");
          }
        } else {
          stateManager.update("Main", "Notifications", "change", [
            {"Type": "error", "Value": ts.eRR, "TimeOut": 7000}
          ]);
          //print("error from server: ${ts.eRR} : $ts");
        }
      } catch (error) {
        stateManager.update("Main", "Notifications", "change", [
          {"Type": "error", "Value": error.toString(), "TimeOut": 7000}
        ]);
        //print("catch error : $error : $ts");
      }
    });

    runner.addMultipleHandler("data.save", (TransferSingle ts) {
      try {
        if (ts.eRR == "") {
          var val = SaveLocal.fromBuffer(ts.dATA);
          setData(val.key, val.value);
          //print("DATA RETURNED FROM SERVER: $val $ts");
        } else {
          stateManager.update("Main", "Notifications", "change", [
            {"Type": "error", "Value": ts.eRR, "TimeOut": 7000}
          ]);
          //print("error from server: ${ts.ERR} : $ts");
        }
      } catch (error) {
        stateManager.update("Main", "Notifications", "change", [
          {"Type": "error", "Value": error.toString(), "TimeOut": 7000}
        ]);
        //print("catch error : $error : $ts");
      }
    });

    runner.addSingleHandler("realtime.s.s.s.err", (Transfer ts) {
      if (ts.eRR != "") {
        stateManager.update("Main", "Notifications", "change", [
          {"Type": "error", "Value": ts.eRR, "TimeOut": 7000}
        ]);
      }

      ts.oBJS.forEach((v) {
        if (v.eRR != "") {
          stateManager.update("Main", "Notifications", "change", [
            {
              "Type": "error",
              "Value": "Instruction '${v.iNS}' returned with error '${v.eRR}'",
              "TimeOut": 7000
            }
          ]);
        }
      });
    });

    runner.addMultipleHandler("data.delete", (TransferSingle ts) {
      try {
        if (ts.eRR == "") {
          var val = SaveLocal.fromBuffer(ts.dATA);
          delData(val.key);
        } else {
          stateManager.update("Main", "Notifications", "change", [
            {"Type": "error", "Value": ts.eRR, "TimeOut": 7000}
          ]);
          //print("error from server: ${ts.ERR} : $ts");
        }
      } catch (error) {
        stateManager.update("Main", "Notifications", "change", [
          {"Type": "error", "Value": error.toString(), "TimeOut": 7000}
        ]);
        //print("catch error : $error : $ts");
      }
    });
  }
}

// void CreateSimplec(List<String> urls, String orgId, String tempId,
//     String rootPlugin, Map<String, String> data) {
//   if (window.simplec != null) {
//     window.simplec.runner.disconnect();
//   }
//   var sc = Simplec(urls, orgId, tempId, rootPlugin, data);
//   sc.runner.connect();
//   window.simplec = sc;
// }

// extension WindowExtension on Window {
//   Simplec get simplec => this.simplec;
//   set simplec(Simplec value) {
//     this.simplec = value;
//   }
// }
