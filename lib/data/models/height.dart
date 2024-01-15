import 'package:json_annotation/json_annotation.dart';
part 'height.g.dart';

@JsonSerializable()
class Height {
  Height({required this.date, required this.value});

  DateTime date;
  double value;

  factory Height.fromJson(Map<String, dynamic> json) => _$HeightFromJson(json);

  /// Connect the generated [_$HeightToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$HeightToJson(this);
}
