import 'package:equatable/equatable.dart';
import '../../../../core/domain/entities/type_service_entity.dart';

abstract class HomeEntity extends Equatable {
  const HomeEntity({
    required this.imageSlider,
    required this.lastServices,
    required this.popularServices
  });

  final List<String> imageSlider;
  final List<TypeServiceEntity> lastServices;
  final List<TypeServiceEntity> popularServices;

  @override
  List<Object?> get props => [
    imageSlider,
    lastServices,
    popularServices
  ];
}