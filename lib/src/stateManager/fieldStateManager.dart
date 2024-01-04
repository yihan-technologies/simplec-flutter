class FieldStateManager {
  dynamic value;

  Map<String, dynamic Function(dynamic, dynamic)> actions =
      <String, dynamic Function(dynamic, dynamic)>{};

  Map<String, void Function(dynamic)> updateListeners =
      <String, void Function(dynamic)>{};

  Map<String, void Function(String, dynamic)> partialUpdateListeners =
      <String, void Function(String, dynamic)>{};

  FieldStateManager(dynamic val) {
    value = val;
    actions = <String, dynamic Function(dynamic, dynamic)>{};
    updateListeners = <String, void Function(dynamic)>{};
    partialUpdateListeners = <String, void Function(String, dynamic)>{};
  }

  String update(String action, dynamic val) {
    var act = actions[action];
    if (act == null) {
      return "invalid action";
    }
    value = act(value, val);
    var keys = updateListeners.keys.toList();
    for (var i = 0; i < keys.length; i++) {
      updateListeners[keys[i]]!(value);
    }
    keys = partialUpdateListeners.keys.toList();
    for (var i = 0; i < keys.length; i++) {
      partialUpdateListeners[keys[i]]!(action, val);
    }
    return "";
  }

  void setAction(String key, dynamic Function(dynamic, dynamic) action) {
    actions[key] = action;
  }

  void setUpdateListener(String key, void Function(dynamic) action) {
    updateListeners[key] = action;
  }

  void deleteListener(String key) {
    updateListeners.remove(key);
    partialUpdateListeners.remove(key);
  }

  void setPartialUpdateListener(
      String key, void Function(String, dynamic) action) {
    partialUpdateListeners[key] = action;
  }

  dynamic getValue() {
    return value;
  }
}

class ComponentStateManager {
  Map<String, FieldStateManager> fields = <String, FieldStateManager>{};
  Map<String, Function> updateListeners = <String, Function>{};
  Map<String, Function> partialUpdateListeners = <String, Function>{};

  ComponentStateManager() {
    fields = {};
    updateListeners = {};
    partialUpdateListeners = {};
  }

  String? update(String field, String action, dynamic val) {
    if (!fields.containsKey(field)) {
      return "no field with key '$field' exist for this component";
    }

    String? ret = fields[field]?.update(action, val);
    if (ret != null) {
      updateListeners.forEach((key, value) {
        value(field, action);
      });
      partialUpdateListeners.forEach((key, value) {
        value(field, action, val);
      });
    }

    return ret;
  }

  void setUpdateComponentListener(String key, Function action) {
    updateListeners[key] = action;
  }

  void setpartialUpdateComponentListener(String key, Function action) {
    partialUpdateListeners[key] = action;
  }

  void setUpdateFieldListener(
      String key, String field, void Function(dynamic) action) {
    if (fields.containsKey(field)) {
      fields[field]?.setUpdateListener(key, action);
    }
  }

  void setpartialUpdateFieldListener(
      String key, String field, void Function(String, dynamic) action) {
    if (fields.containsKey(field)) {
      fields[field]?.setPartialUpdateListener(key, action);
    }
  }

  void deleteListener(String field, String key) {
    if (field == "") {
      updateListeners.remove(key);
      partialUpdateListeners.remove(key);
      return;
    }
    if (fields.containsKey(field)) {
      fields[field]?.deleteListener(key);
    }
  }
}

class StateManger {
  Map<String, FieldStateManager> fields = <String, FieldStateManager>{};
  Map<String, ComponentStateManager> components =
      <String, ComponentStateManager>{};
  Map<String, Function> updateListeners = <String, Function>{};
  Map<String, Function> partialUpdateListeners = <String, Function>{};

  StateManger() {
    fields = {};
    components = {};
    updateListeners = {};
    partialUpdateListeners = {};
  }

  String? update(String comp, String field, String action, dynamic val) {
    String? ret = "";
    if (field == "") {
      return "no field with key '$field'";
    }
    if (comp == "") {
      ret = fields[field]?.update(action, val);
    } else {
      if (!components.containsKey(comp)) {
        return "no component with this key '$field'";
      }
      ret = components[comp]?.update(field, action, val);
    }
    updateListeners.forEach((key, value) {
      value(comp, field, action);
    });
    partialUpdateListeners.forEach((key, value) {
      value(comp, field, action, val);
    });
    return ret;
  }

  void setUpdateComponentListener(String comp, String key, Function action) {
    if (components.containsKey(comp)) {
      components[comp]?.setUpdateComponentListener(key, action);
    }
  }

  void setpartialUpdateComponentListener(
      String comp, String key, Function action) {
    if (components.containsKey(comp)) {
      components[comp]?.setpartialUpdateComponentListener(key, action);
    }
  }

  void setUpdateFieldListener(
      String comp, String key, String field, void Function(dynamic) action) {
    if (comp == "") {
      if (fields.containsKey(field)) {
        fields[field]?.setUpdateListener(key, action);
      }
    } else {
      if (components.containsKey(comp)) {
        components[comp]?.fields[field]?.setUpdateListener(key, action);
      }
    }
  }

  void setpartialUpdateFieldListener(String comp, String key, String field,
      void Function(String, dynamic) action) {
    if (comp == "") {
      if (fields.containsKey(field)) {
        fields[field]?.setPartialUpdateListener(key, action);
      }
    } else {
      if (components.containsKey(comp)) {
        components[comp]?.fields[field]?.setPartialUpdateListener(key, action);
      }
    }
  }

  void deleteListener(String comp, String field, String key) {
    if (comp == "") {
      updateListeners.remove(key);
      partialUpdateListeners.remove(key);
    } else if (components.containsKey(comp)) {
      components[comp]?.deleteListener(field, key);
    }
  }

  String addField(String comp, String field, dynamic val) {
    if (field == "") {
      return "empty field provided";
    }
    if (comp == "") {
      fields[field] = FieldStateManager(val);
    } else {
      if (!components.containsKey(comp)) {
        components[comp] = ComponentStateManager();
      }
      components[comp]?.fields[field] = FieldStateManager(val);
    }
    return "";
  }

  String addFieldIfItDoeaNotExist(String comp, String field, dynamic val) {
    if (fieldExist(comp, field) == null || fieldExist(comp, field) == false) {
      return addField(comp, field, val);
    }
    return "";
  }

  dynamic getField(String comp, String field) {
    if (field == "") {
      throw Error();
    }
    if (comp == "") {
      return fields[field]?.getValue();
    } else {
      return components[comp]?.fields[field]?.getValue();
    }
  }

  String addAction(String comp, String field, String key,
      dynamic Function(dynamic, dynamic) action) {
    if (field == "") {
      return "empty field provided";
    }
    if (comp == "") {
      fields[field]?.setAction(key, action);
    } else {
      components[comp]?.fields[field]?.setAction(key, action);
    }
    return "";
  }

  bool? fieldExist(String comp, String field) {
    if (comp == "") {
      if (fields.containsKey(field)) {
        return true;
      }
    } else {
      if (components.containsKey(comp) &&
          components[comp] != null &&
          components[comp]?.fields != null) {
        return components[comp]?.fields.containsKey(field);
      }
    }
    return false;
  }
}
