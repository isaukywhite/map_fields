import 'dart:convert';

import 'erros.dart';

class MapFields {
  MapFields._(this.map);
  final Map<String, dynamic> map;

  factory MapFields.load(dynamic value) {
    if (value == null) {
      throw InvalidMapStringObjectError();
    }
    final mapValue = value is String ? json.decode(value) : value;
    return MapFields._(mapValue);
  }

  T _getField<T>(
    String key,
    T? defaultValue,
    T? Function(String) getter,
  ) {
    try {
      final value = getter(key);
      if (value != null) {
        return value;
      }
      if (defaultValue != null) {
        return defaultValue;
      }
      throw MapFieldsErrorMissingRequiredField(key);
    } catch (e) {
      if (e is MapFieldsError) {
        rethrow;
      }
      throw UnknownErrorMapFieldsError(key, e);
    }
  }

  String getString(String key, [String? defaultValue]) {
    return _getField<String>(
      key,
      defaultValue,
      getStringNullable,
    );
  }

  String? getStringNullable(String key) {
    if (map.containsKey(key)) {
      return map[key]?.toString();
    }
    return null;
  }

  int getInt(String key, [int? defaultValue]) {
    return _getField<int>(
      key,
      defaultValue,
      getIntNullable,
    );
  }

  int? getIntNullable(String key) {
    if (map.containsKey(key)) {
      return double.tryParse(map[key].toString())?.toInt();
    }
    return null;
  }

  bool getBool(String key, [bool? defaultValue]) {
    return _getField<bool>(
      key,
      defaultValue,
      getBoolNullable,
    );
  }

  bool? getBoolNullable(String key) {
    if (map.containsKey(key)) {
      return map[key].toString().toLowerCase() == 'true';
    }
    return null;
  }

  double getDouble(String key, [double? defaultValue]) {
    return _getField<double>(
      key,
      defaultValue,
      getDoubleNullable,
    );
  }

  double? getDoubleNullable(String key) {
    if (map.containsKey(key)) {
      return double.tryParse(map[key].toString());
    }
    return null;
  }

  DateTime getDateTime(String key, [DateTime? defaultValue]) {
    return _getField<DateTime>(
      key,
      defaultValue,
      getDateTimeNullable,
    );
  }

  DateTime? getDateTimeNullable(String key) {
    try {
      return DateTime.now().get(getStringNullable(key));
    } catch (e) {
      return null;
    }
  }

  List<T> getList<T>(String key, [List<T>? defaultValue]) {
    return _getField<List<T>>(
      key,
      defaultValue,
      getListNullable,
    );
  }

  List<T>? getListNullable<T>(String key) {
    try {
      return map[key] as List<T>?;
    } catch (e) {
      return null;
    }
  }
}

extension on DateTime {
  DateTime? get(dynamic value) {
    try {
      return DateTime.parse(value);
    } catch (e) {
      return _getFromMillisecondsSinceEpoch(value);
    }
  }

  DateTime? _getFromMillisecondsSinceEpoch(String value) {
    try {
      final intValue = int.parse(value);
      return DateTime.fromMicrosecondsSinceEpoch(intValue);
    } catch (_) {
      return null;
    }
  }
}
