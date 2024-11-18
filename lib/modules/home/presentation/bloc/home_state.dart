part of 'home_bloc.dart';

class HomeState extends Equatable {
  const HomeState({
    this.homeStatus = Status.loading,
    this.message = '',
    this.homeEntity
  });

  final Status homeStatus;
  final String message;
  final HomeEntity? homeEntity;

  HomeState copyWith({
    Status? homeStatus,
    HomeEntity? homeEntity,
    String? message
  }) {
    return HomeState(
      homeStatus: homeStatus ?? this.homeStatus,
      message: message ?? this.message,
      homeEntity: homeEntity ?? this.homeEntity
    );
  }

  @override
  List<Object?> get props => [
    homeStatus,
    message,
    homeEntity
  ];
}