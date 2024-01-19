import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
part 'weight.g.dart';

@HiveType(typeId: 2)
@JsonSerializable()
class Weight extends HiveObject {
  Weight({required this.date, required this.value});

  @HiveField(0)
  DateTime date;
  @HiveField(1)
  double value;

  factory Weight.fromJson(Map<String, dynamic> json) => _$WeightFromJson(json);

  /// Connect the generated [_$WeightToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$WeightToJson(this);
}
