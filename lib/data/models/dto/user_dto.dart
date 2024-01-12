import 'package:neofit_app/data/models/models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_dto.g.dart';

@JsonSerializable()
class UserDTO extends User {
  UserDTO({required String email, String username = '', required this.password})
      : super(email: email, username: username);
  String password;

  factory UserDTO.fromJson(Map<String, dynamic> json) =>
      _$UserDTOFromJson(json);

  /// Connect the generated [_$UserDTOToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$UserDTOToJson(this);
}
