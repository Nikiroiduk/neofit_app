import 'package:json_annotation/json_annotation.dart';
part 'weight.g.dart';

@JsonSerializable()
class Weight {
  Weight({required this.date, required this.value});

  DateTime date;
  double value;

  factory Weight.fromJson(Map<String, dynamic> json) => _$WeightFromJson(json);

  /// Connect the generated [_$WeightToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$WeightToJson(this);
}
