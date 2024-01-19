import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
part 'height.g.dart';

@HiveType(typeId: 3)
@JsonSerializable()
class Height extends HiveObject {
  Height({required this.date, required this.value});

  @HiveField(0)
  DateTime date;
  @HiveField(1)
  double value;

  factory Height.fromJson(Map<String, dynamic> json) => _$HeightFromJson(json);

  /// Connect the generated [_$HeightToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$HeightToJson(this);
}
