import 'dart:convert';

import 'erros.dart';

/// Class for treatment of map fields.
class MapFields {
  MapFields._(this.map);
  final Map<String, dynamic> map;

  /// ## Load method
  /// Load the json string or map into a MapFields object.
  ///
  /// ### Usage
  /// ```dart
  /// final json = '{"key": "value"}';
  /// final mapFieldsFromJson = MapFields.load(json);
  ///
  /// final map = {'key': 'value'};
  /// final mapFieldsFromMap = MapFields.load(map);
  /// ```
  factory MapFields.load(dynamic value) {
    if (value == null) {
      throw InvalidMapStringObjectError();
    }
    final mapValue = value is String ? json.decode(value) : value;
    return MapFields._(mapValue);
  }

  /// Get the key value as T.
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

  /// Get the key value as String.
  String getString(String key, [String? defaultValue]) {
    return _getField<String>(
      key,
      defaultValue,
      getStringNullable,
    );
  }

  /// Get the key value as String?.
  String? getStringNullable(String key) {
    if (map.containsKey(key)) {
      return map[key]?.toString();
    }
    return null;
  }

  /// Get the key value as int.
  int getInt(String key, [int? defaultValue]) {
    return _getField<int>(
      key,
      defaultValue,
      getIntNullable,
    );
  }

  /// Get the key value as int?.
  int? getIntNullable(String key) {
    if (map.containsKey(key)) {
      return double.tryParse(map[key].toString())?.toInt();
    }
    return null;
  }

  /// Get the key value as bool.
  bool getBool(String key, [bool? defaultValue]) {
    return _getField<bool>(
      key,
      defaultValue,
      getBoolNullable,
    );
  }

  /// Get the key value as bool?.
  bool? getBoolNullable(String key) {
    if (map.containsKey(key)) {
      return map[key].toString().toLowerCase() == 'true';
    }
    return null;
  }

  /// Get the key value as double.
  double getDouble(String key, [double? defaultValue]) {
    return _getField<double>(
      key,
      defaultValue,
      getDoubleNullable,
    );
  }

  /// Get the key value as double?.
  double? getDoubleNullable(String key) {
    if (map.containsKey(key)) {
      return double.tryParse(map[key].toString());
    }
    return null;
  }

  /// Get the key value as DateTime.
  DateTime getDateTime(String key, [DateTime? defaultValue]) {
    return _getField<DateTime>(
      key,
      defaultValue,
      getDateTimeNullable,
    );
  }

  /// Get the key value as DateTime?.
  DateTime? getDateTimeNullable(String key) {
    try {
      return DateTime.now().get(getStringNullable(key));
    } catch (e) {
      return null;
    }
  }

  /// Get the key value as List<T>.
  List<T> getList<T>(String key, [List<T>? defaultValue]) {
    return _getField<List<T>>(
      key,
      defaultValue,
      getListNullable,
    );
  }

  /// Get the key value as List<T>?.
  List<T>? getListNullable<T>(String key) {
    try {
      return (map[key] as List?)?.cast<T>();
    } catch (e) {
      return null;
    }
  }
}

// Extension for DateTime.convert.
extension on DateTime {
  /// Get DateTime? from value.
  DateTime? get(dynamic value) {
    try {
      return DateTime.parse(value);
    } catch (e) {
      return _getFromMillisecondsSinceEpoch(value);
    }
  }

  /// Get DateTime? from milliseconds since epoch.
  DateTime? _getFromMillisecondsSinceEpoch(String value) {
    try {
      final intValue = int.parse(value);
      return DateTime.fromMicrosecondsSinceEpoch(intValue);
    } catch (_) {
      return null;
    }
  }
}
