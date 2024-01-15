import 'package:json_annotation/json_annotation.dart';
import 'package:neofit_app/data/models/models.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  User(
      {this.email = '',
      this.username = '',
      this.isMale,
      this.height,
      this.weight,
      this.birthDay,
      this.isConfigured = false});

  String email;
  String username;
  bool? isMale;
  List<Height>? height;
  List<Weight>? weight;
  DateTime? birthDay;
  bool isConfigured;

  int get age {
    if (birthDay == null) return 0;
    var today = DateTime.now();
    final year = today.year - birthDay!.year;
    final mth = today.month - birthDay!.month;
    return mth < 0 ? year - 1 : year;
  }

  static User get empty {
    return User();
  }

  @override
  String toString() {
    return 'Email: $email\nUsername: $username\nisConfigured: $isConfigured\n';
  }

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  /// Connect the generated [_$UserToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
