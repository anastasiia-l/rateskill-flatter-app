import 'dart:convert';

import 'package:meta/meta.dart';

class Staff {
  Staff({
    @required this.username,
    @required this.name,
    @required this.email,
    @required this.type,
    @required this.gender,
    @required this.birthday,
    @required this.socialLink,
    @required this.responsibility,
    @required this.occupation,
  });

  final String username;
  final String name;
  final String email;
  final String type;
  final String gender;
  final String birthday;
  final String socialLink;
  final String responsibility;
  final String occupation;

  static List<Staff> allStaffFromResponse(String response) {
    var decodedJson = json.decode(response);

    return decodedJson['staff']
        .cast<Map<String, dynamic>>()
        .map((obj) => Staff.fromMap(obj))
        .toList()
        .cast<Staff>();
  }

  static List<Staff> allManagersFromResponse(String response) {
    var decodedJson = json.decode(response);

    return decodedJson['managers']
        .cast<Map<String, dynamic>>()
        .map((obj) => Staff.fromMap(obj))
        .toList()
        .cast<Staff>();
  }

  static Staff fromMap(Map map) {
    return new Staff(
      username: map['user']['username'],
      name: map['user']['first_name'] + ' ' + map['user']['last_name'],
      email: map['user']['email'],
      type: map['user']['is_manager'] ? 'Manager' : 'Staff',
      gender: map['user']['profile']['gender'],
      birthday: map['user']['profile']['birthday'],
      socialLink: map['user']['profile']['social_link'],
      responsibility: map['responsibility'],
      occupation: map['occupation'],
    );
  }
}
