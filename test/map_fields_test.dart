import 'package:map_fields/src/erros.dart';
import 'package:map_fields/src/map_fields_base.dart';
import 'package:test/test.dart';

void main() {
  test('List', () {
    final map = '{"key": [{"key": "value","key2": 1}]}';
    final mapFields = MapFields.load(map);
    expect(
      mapFields.getList<Map<String, dynamic>>('key'),
      isA<List<Map<String, dynamic>>>(),
    );
  });
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

  group('MapFieldsTests => Map', () {
    test('normal as String', () {
      final map = '{"key": {"teste": 123, "teste2": "123"}}';
      final mapFields = MapFields.load(map);
      expect(
        mapFields.getMap<String, dynamic>('key'),
        {'teste': 123, 'teste2': '123'},
      );
    });
    test('normal', () {
      final map = <String, dynamic>{
        'key': {'teste': 123, 'teste2': '123'}
      };
      final mapFields = MapFields.load(map);
      expect(
        mapFields.getMap<String, dynamic>('key'),
        {'teste': 123, 'teste2': '123'},
      );
    });
    test('is null, with default value', () {
      final map = <String, dynamic>{'key': null};
      final mapFields = MapFields.load(map);
      expect(
        mapFields.getMap<String, dynamic>(
          'key',
          {},
        ),
        {},
      );
    });
    test('key does not exist, with default value', () {
      final map = <String, dynamic>{};
      final mapFields = MapFields.load(map);
      expect(mapFields.getMap<String, dynamic>('key', {}), {});
    });
    test('key does not exist as String, with default value', () {
      final map = '{}';
      final mapFields = MapFields.load(map);
      expect(mapFields.getMap<String, dynamic>('key', {}), {});
    });
    test('key does not exist, without default value - return throw', () {
      final map = <String, dynamic>{};
      final mapFields = MapFields.load(map);

      expect(
        () => mapFields.getMap<String, dynamic>('key'),
        throwsA(isA<MapFieldsErrorMissingRequiredField>()),
      );
    });
  });
}
