part of 'searcher_bloc.dart';

class SearcherState extends Equatable {
  final Status searcherStatus;
  final String message;
  final List<CatDetailEntity>? searchData;

  const SearcherState({
    this.searcherStatus = Status.undefined,
    this.message = '',
    this.searchData
  });

  SearcherState copyWith({
    Status? searcherStatus,
    List<CatDetailEntity>? searchData,
    String? message
  }) => SearcherState(
    searcherStatus: searcherStatus ?? this.searcherStatus,
    message: message ?? this.message,
    searchData: searchData ?? this.searchData
  );

  @override
  List<Object?> get props => [
    searcherStatus,
    message,
    searchData
  ];
}