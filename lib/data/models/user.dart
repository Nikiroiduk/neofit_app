import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  User({this.token = '', this.email = '', this.username = ''});
  String token;
  String email;
  String username;

  static User get empty {
    return User(token: '');
  }

  bool get isEmpty {
    return token == '';
  }

  @override
  String toString() {
    return 'Token: $token\nEmail: $email\nUsername: $username\n';
  }

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  /// Connect the generated [_$UserToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
