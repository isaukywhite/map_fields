import 'package:map_fields/src/erros.dart';
import 'package:map_fields/src/map_fields_base.dart';
import 'package:test/test.dart';

void main() {
  group('MapFieldsTests => String', () {
    test('normal', () {
      final map = <String, dynamic>{'key': 'value'};
      final mapFields = MapFields.load(map);
      expect(mapFields.getString('key'), 'value');
    });
    test('is null, with default value', () {
      final map = <String, dynamic>{'key': null};
      final mapFields = MapFields.load(map);
      expect(mapFields.getString('key', 'value'), 'value');
    });
    test('key does not exist, with default value', () {
      final map = <String, dynamic>{};
      final mapFields = MapFields.load(map);
      expect(mapFields.getString('key', 'value'), 'value');
    });
    test('key does not exist, without default value - return throw', () {
      final map = <String, dynamic>{};
      final mapFields = MapFields.load(map);

      expect(
        () => mapFields.getString('key'),
        throwsA(isA<MapFieldsErrorMissingRequiredField>()),
      );
    });
    test('key exist, but value is not string', () {
      final map = <String, dynamic>{'key': 0};
      final mapFields = MapFields.load(map);

      expect(mapFields.getString('key'), '0');
    });
  });

  group('MapFieldsTests => int', () {
    test('normal', () {
      final map = <String, dynamic>{'key': 0};
      final mapFields = MapFields.load(map);
      expect(mapFields.getInt('key'), 0);
    });
    test('is null, with default value', () {
      final map = <String, dynamic>{'key': null};
      final mapFields = MapFields.load(map);
      expect(mapFields.getInt('key', 0), 0);
    });
    test('key does not exist, with default value', () {
      final map = <String, dynamic>{};
      final mapFields = MapFields.load(map);
      expect(mapFields.getInt('key', 0), 0);
    });
    test('key does not exist, without default value - return throw', () {
      final map = <String, dynamic>{};
      final mapFields = MapFields.load(map);

      expect(
        () => mapFields.getInt('key'),
        throwsA(isA<MapFieldsErrorMissingRequiredField>()),
      );
    });
  });
}
