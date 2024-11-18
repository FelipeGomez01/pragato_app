import 'package:equatable/equatable.dart';

class WeightEntity extends Equatable {
  final String imperial;
  final String metric;

  const WeightEntity({
    required this.imperial,
    required this.metric,
  });

  WeightEntity copyWith({
    String? imperial,
    String? metric,
  }) =>
      WeightEntity(
        imperial: imperial ?? this.imperial,
        metric: metric ?? this.metric,
      );

  @override
  List<Object?> get props => [
    imperial,
    metric
  ];
}