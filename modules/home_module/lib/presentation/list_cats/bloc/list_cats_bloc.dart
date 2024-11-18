import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_module/domain/entities/base_data_entity.dart';
import 'package:home_module/domain/use_cases/get_list_use_case.dart';
import 'package:shared/utils/status.dart';

part 'list_cats_event.dart';
part 'list_cats_state.dart';

class ListCatsBloc extends Bloc<ListCatsEvent, HomeState> {
  final GetListUseCase getListUseCase;
  final int _pageSize = 10;
  int _currentPage = 0;

  ListCatsBloc({
    required this.getListUseCase
  }) : super(const HomeState()) {
    on<GetListEvent>(_onLoadHome);
    on<LoadMoreCatsEvent>(_onLoadMoreCats);
  }

  void _onLoadHome(GetListEvent event, Emitter<HomeState> emit) async {
    final homeData = await getListUseCase.run();

    homeData.fold(
      (failure) => emit(
        state.copyWith(
          homeStatus: Status.error,
          message: failure
        )
      ),
      (success) => emit(
        state.copyWith(
          homeData: success,
          homeStatus: Status.success
        )
      )
    );
  }

  void _onLoadMoreCats(LoadMoreCatsEvent event, Emitter<HomeState> emit) async {
    final newData = await getListUseCase.run(nextPage: _currentPage++);//fetchData(page: _currentPage, pageSize: _pageSize);
    newData.fold(
      (failure) => emit(
        state.copyWith(
          homeStatus: Status.error,
          message: failure
        )
      ),
      (success) => emit(
        state.copyWith(
          homeData: state.homeData! + success,
          homeStatus: Status.success,
        )
      )
    );
  }
}