import 'package:meta/meta.dart';

class Profile {
  Profile({
    @required this.username,
    @required this.name,
    @required this.email,
    @required this.type,
    @required this.gender,
    @required this.birthday,
    @required this.socialLink,
  });

  final String username;
  final String name;
  final String email;
  final String type;
  final String gender;
  final String birthday;
  final String socialLink;

  static Profile fromMap(Map map) {
    return new Profile(
      username: map['username'],
      name: map['first_name'] + ' ' + map['last_name'],
      email: map['email'],
      type: map['is_manager'] ? 'Manager' : 'Staff',
      gender: map['profile']['gender'],
      birthday: map['profile']['birthday'],
      socialLink: map['profile']['social_link'],
    );
  }
}
