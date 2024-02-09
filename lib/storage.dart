import 'package:uuid/uuid.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<Type> getData<Type>(String key) async {
  var ins = await SharedPreferences.getInstance();
  var val = ins.get(key);

  if (val == null && key == "instanceId") {
    var uuidData = const Uuid().v4();
    await setData(key, uuidData);
    return uuidData as Type;
  }

  return val as Type;
}

Future<bool> setData(String key, dynamic val) async {
  var ins = await SharedPreferences.getInstance();

  if (val is String) {
    return ins.setString(key, val);
  } else if (val is bool) {
    return ins.setBool(key, val);
  } else if (val is double) {
    return ins.setDouble(key, val);
  } else if (val is int) {
    return ins.setInt(key, val);
  } else if (val is List<String>) {
    return ins.setStringList(key, val);
  }

  return false;
}

Future<bool> delData(String key) async {
  var ins = await SharedPreferences.getInstance();

  return ins.remove(key);
}
