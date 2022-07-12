import 'package:map_fields/map_fields.dart';
import 'package:map_fields/src/erros.dart';

void main() {
  try {
    final map = {
      'name': 'Isac Dev',
      'is_dev': true,
    };
    final person = Person.fromMap(map);
    print(person); // Person(name: Isac Dev, isDev: true)
  } on MapFieldsError {
    // get error in map fields here
  } catch (e) {
    rethrow;
  }
}

class Person {
  final String name;
  final bool isDev;
  Person({
    required this.name,
    required this.isDev,
  });

  factory Person.fromMap(Map<String, dynamic> map) {
    final fields = MapFields.load(map);
    return Person(
      name: fields.getString('name'),
      isDev: fields.getBool('is_dev', false),
    );
  }

  @override
  String toString() {
    return 'Person(name: $name, isDev: $isDev)';
  }
}
