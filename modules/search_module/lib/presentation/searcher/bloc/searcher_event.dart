part of 'list_cats_bloc.dart';

abstract class ListCatsEvent extends Equatable {
  const ListCatsEvent();

  @override
  List<Object> get props => [];
}

class GetListEvent extends ListCatsEvent {
  const GetListEvent();

  @override
  List<Object> get props => [];
}