import 'package:logger/logger.dart' as dart_log;
import 'package:intl/intl.dart';
import 'dart:convert';

/*
 3 Debug
 2 warning
 1 Info
 0 Error
-1 Fatal
*/

class SingleLog {
  int level;

  Logger log;

  Map<String, dynamic> data = <String, dynamic>{};

  SingleLog({required this.level, required this.log});

  SingleLog err(Object? e) {
    if (e != null) {
      data['error'] = e.toString();
    }
    return this;
  }

  SingleLog interface(String name, dynamic dat) {
    data[name] = dat;
    return this;
  }

  SingleLog datta(dynamic dat) {
    data['data'] = dat;
    return this;
  }

  SingleLog float64(String name, double dat) {
    data[name] = dat;
    return this;
  }

  SingleLog str(String name, String dat) {
    data[name] = dat;
    return this;
  }

  void msg(String mesg) {
    data["LOGGERID"] = mesg;
    data["service"] = log.service;

    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-ddTkk:mm:ss').format(now);
    data["TIME"] = formattedDate;

    switch (level) {
      case -1:
        log.dlog.f(data);
        break;
      case 0:
        log.dlog.e(data);
        break;
      case 1:
        log.dlog.i(data);
        break;
      case 2:
        log.dlog.w(data);
        break;
      case 3:
        log.dlog.d(data);
        break;
      default:
        log.dlog.e(data);
    }
  }

  String getMsg(String mesg) {
    data["LOGGERID"] = mesg;
    data["service"] = log.service;

    switch (level) {
      case -1:
        data["LEVEL"] = "FATAL";
        break;
      case 0:
        data["LEVEL"] = "ERROR";
        break;
      case 1:
        data["LEVEL"] = "INFO";
        break;
      case 2:
        data["LEVEL"] = "WARN";
        break;
      case 3:
        data["LEVEL"] = "DEBUG";
        break;
      default:
        data["LEVEL"] = level;
    }

    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-ddTkk:mm:ss').format(now);
    data["TIME"] = formattedDate;

    return json.encode(data);
  }
}

class Logger {
  int level;
  String service;
  late dart_log.Logger dlog;

  Logger({required this.level, required this.service}) {
    dlog = dart_log.Logger(
        level: convrtLevel(level), printer: dart_log.PrettyPrinter());
  }

  int getLevel() {
    return level;
  }

  dart_log.Level convrtLevel(int l) {
    var lev = dart_log.Level.error;

    switch (l) {
      case -1:
        lev = dart_log.Level.fatal;
        break;
      case 0:
        lev = dart_log.Level.error;
        break;
      case 1:
        lev = dart_log.Level.info;
        break;
      case 2:
        lev = dart_log.Level.warning;
        break;
      case 3:
        lev = dart_log.Level.debug;
        break;
      default:
        lev = dart_log.Level.all;
    }

    return lev;
  }

  SingleLog error() {
    var sl = SingleLog(level: 0, log: this);
    sl.data = {};
    return sl;
  }

  SingleLog debug() {
    var sl = SingleLog(level: 3, log: this);
    sl.data = {};
    return sl;
  }

  SingleLog info() {
    var sl = SingleLog(level: 2, log: this);
    sl.data = {};
    return sl;
  }

  SingleLog warn() {
    var sl = SingleLog(level: 1, log: this);
    sl.data = {};
    return sl;
  }

  SingleLog fatal() {
    var sl = SingleLog(level: -1, log: this);
    sl.data = {};
    return sl;
  }

  SingleLog stack() {
    var sl = SingleLog(level: -1, log: this);
    sl.data = {};
    return sl;
  }

  void errorf(String key, List<Object?> data) {
    var sl = SingleLog(level: 0, log: this);
    sl.data = {};
    for (var i = 0; i < data.length; i++) {
      sl.data[i.toString()] = data[i];
    }
    sl.msg(key);
  }

  void warningf(String key, List<Object?> data) {
    var sl = SingleLog(level: 2, log: this);
    sl.data = {};
    for (var i = 0; i < data.length; i++) {
      sl.data[i.toString()] = data[i];
    }
    sl.msg(key);
  }

  void warnf(String key, List<Object?> data) {
    var sl = SingleLog(level: 2, log: this);
    sl.data = {};
    for (var i = 0; i < data.length; i++) {
      sl.data[i.toString()] = data[i];
    }
    sl.msg(key);
  }

  void infof(String key, List<Object?> data) {
    var sl = SingleLog(level: 1, log: this);
    sl.data = {};
    for (var i = 0; i < data.length; i++) {
      sl.data[i.toString()] = data[i];
    }
    sl.msg(key);
  }

  void debugf(String key, List<Object?> data) {
    var sl = SingleLog(level: 3, log: this);
    sl.data = {};
    for (var i = 0; i < data.length; i++) {
      sl.data[i.toString()] = data[i];
    }
    sl.msg(key);
  }

  void print(List<Object?> data) {
    var sl = SingleLog(level: 3, log: this);
    sl.data = {};
    for (var i = 0; i < data.length; i++) {
      sl.data[i.toString()] = data[i];
    }
    sl.msg('log.Print');
  }

  void printf(String key, List<Object?> data) {
    var k = key;
    for (var i = 0; i < data.length; i++) {
      k = k.replaceAll('%s', data[i].toString());
    }
    var sl = SingleLog(level: 3, log: this);
    sl.data = {};
    sl.data['data'] = k;
    sl.msg('log.Printf');
  }

  void sharedLog(String typ, String msg, Object? err, List<Object?> data) {
    SingleLog sl;

    switch (typ) {
      case 'error':
        sl = error();
        break;
      case 'warn':
        sl = warn();
        break;
      case 'info':
        sl = info();
        break;
      case 'debug':
        sl = debug();
        break;
      case 'fatal':
        sl = fatal();
        break;
      default:
        sl = error();
    }
    for (var i = 0; i < data.length; i++) {
      sl.interface(i.toString(), data[i]);
    }
    sl.err(err);
    sl.msg(msg);
  }
}
