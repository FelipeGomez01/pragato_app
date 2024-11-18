part of 'searcher_bloc.dart';

abstract class SearcherEvent extends Equatable {
  const SearcherEvent();

  @override
  List<Object> get props => [];
}

class GetDataEvent extends SearcherEvent {
  final String query;

  const GetDataEvent({required this.query});

  @override
  List<Object> get props => [
    query
  ];
}