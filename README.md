
# MapFields

A package for handling fields in maps for dart in a simple and fast way.

## Features

- MapFields.load(Map<String, dynamic> map)
- MapFields.getString(String key, [String? defaultValue])
- MapFields.getInt(String key, [int? defaultValue])
- MapFields.getDouble(String key, [double? defaultValue])
- MapFields.getBool(String key, [bool? defaultValue])
- MapFields.getDateTime(String key, [DateTime? defaultValue])
- MapFields.getList\<T>(String key, [List\<T> defaultValue])
- MapFields.getStringNullable(String key)
- MapFields.getIntNullable(String key)
- MapFields.getDoubleNullable(String key)
- MapFields.getBool(String key)
- MapFields.getDateTime(String key)
- MapFields.getList\<T>(String key)

## Installation

```yml
dependencies:
  map_fields: latest
```

## Usage

```dart
import 'package:map_fields/map_fields.dart';

final map = <String, dynamic>{
    'name': 'Isac Dev',
    'is_dev': true
};

final mapFields = MapFields.load(map);
print(mapFields.getString('name')); // 'Isac Dev'
print(mapFields.getBool('is_dev')); // true
print(mapFields.getDateTime('birth', DateTime(1900))); // 1900-01-01 00:00:00.000
print(mapFields.getDateTime('birth')); // throw MapFieldsError
```
