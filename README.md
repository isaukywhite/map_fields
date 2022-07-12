
# MapFields

A package for handling fields in maps for dart in a simple and fast way.

## Features

- MapFields.load()
- getString
- getInt
- getDouble
- getBool
- getDateTime
- getList\<T>
- getStringNullable
- getIntNullable
- getDoubleNullable
- getBoolNullable
- getDateTimeNullable
- getListNullable\<T>

## Installation

```yml
dependencies:
  map_fields: any
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
