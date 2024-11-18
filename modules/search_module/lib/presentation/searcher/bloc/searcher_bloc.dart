import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared/entities/base_data_entity.dart';
import 'package:home_module/domain/use_cases/get_list_use_case.dart';
import 'package:home_module/utils/status.dart';

part 'list_cats_event.dart';
part 'list_cats_state.dart';

class ListCatsBloc extends Bloc<ListCatsEvent, HomeState> {
  final GetListUseCase getListUseCase;

  ListCatsBloc({
    required this.getListUseCase
  }) : super(const HomeState()) {
    on<GetListEvent>(_onLoadHome);
  }

  void _onLoadHome(GetListEvent event, Emitter<HomeState> emit) async {
    //emit(state.copyWith(homeStatus: Status.loading));

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
}