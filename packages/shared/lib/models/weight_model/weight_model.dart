import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared/entities/weight_entity.dart';

part 'weight_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class WeightModel extends Equatable {
  @JsonKey(name: "imperial")
  final String imperial;
  @JsonKey(name: "metric")
  final String metric;

  const WeightModel({
    required this.imperial,
    required this.metric,
  });

  factory WeightModel.fromJson(Map<String, dynamic> json) =>
      _$WeightModelFromJson(json);

  Map<String, dynamic> toJson() => _$WeightModelToJson(this);

  WeightModel copyWith({
    String? imperial,
    String? metric,
  }) =>
      WeightModel(
        imperial: imperial ?? this.imperial,
        metric: metric ?? this.metric,
      );

  @override
  List<Object?> get props => [
    imperial,
    metric
  ];
}

extension WeightModelExt on WeightModel {
  WeightEntity toWeightEntity() => WeightEntity(
    imperial: imperial,
    metric: metric
  );
}