import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:neofit_app/data/models/models.dart';

part 'user.g.dart';

@HiveType(typeId: 1)
@JsonSerializable()
class User extends HiveObject {
  User(
      {this.email = '',
      this.username = '',
      this.isMale,
      this.height,
      this.weight,
      this.birthDay,
      this.isConfigured = false});

  @HiveField(0)
  String email;
  @HiveField(1)
  String username;
  @HiveField(2)
  bool? isMale;
  @HiveField(3)
  List<Height>? height;
  @HiveField(4)
  List<Weight>? weight;
  @HiveField(5)
  DateTime? birthDay;
  @HiveField(6)
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
