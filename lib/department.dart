import 'package:meta/meta.dart';

class Department {
  Department({
    @required this.id,
    @required this.name,
    @required this.type,
    @required this.company,
  });

  final int id;
  final String name;
  final String type;
  final Map company;

  static Department fromMap(Map map) {
    return new Department(
      id: map['id'],
      name: map['name'],
      type: map['type'],
      company: map['company'],
    );
  }
}
