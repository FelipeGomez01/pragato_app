import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_module/di/home_di.dart';
import 'package:home_module/presentation/list_cats/bloc/list_cats_bloc.dart';
import 'package:search_module/di/search_di.dart';
import 'package:search_module/presentation/searcher/bloc/searcher_bloc.dart';

class BlocsDI {
  static get instance => [
    BlocProvider(
        create: (_) => ListCatsBloc(getListUseCase: homeDI.getListUseCase)
    ),
    BlocProvider(
        create: (_) => SearcherBloc(getDataUseCase: searchDI.getDataUseCase)
    )
  ];
}