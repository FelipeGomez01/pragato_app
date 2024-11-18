part of 'list_cats_bloc.dart';

class HomeState extends Equatable {
  final Status homeStatus;
  final String message;
  final List<BaseDataEntity>? homeData;

  const HomeState({
    this.homeStatus = Status.loading,
    this.message = '',
    this.homeData
  });

  HomeState copyWith({
    Status? homeStatus,
    List<BaseDataEntity>? homeData,
    String? message
  }) {
    return HomeState(
      homeStatus: homeStatus ?? this.homeStatus,
      message: message ?? this.message,
      homeData: homeData ?? this.homeData
    );
  }

  @override
  List<Object?> get props => [
    homeStatus,
    message,
    homeData
  ];
}