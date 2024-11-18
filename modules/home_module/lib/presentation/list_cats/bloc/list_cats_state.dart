part of 'list_cats_bloc.dart';

class HomeState extends Equatable {
  final Status homeStatus;
  final String message;
  final List<BaseDataEntity>? homeData;
  final bool hasReachedMax;

  const HomeState({
    this.homeStatus = Status.loading,
    this.message = '',
    this.homeData = const [],
    this.hasReachedMax = false
  });

  HomeState copyWith({
    Status? homeStatus,
    List<BaseDataEntity>? homeData,
    String? message,
    bool? hasReachedMax
  }) => HomeState(
    homeStatus: homeStatus ?? this.homeStatus,
    message: message ?? this.message,
    homeData: homeData ?? this.homeData,
    hasReachedMax: hasReachedMax ?? this.hasReachedMax
  );

  @override
  List<Object?> get props => [
    homeStatus,
    message,
    homeData,
    hasReachedMax
  ];
}