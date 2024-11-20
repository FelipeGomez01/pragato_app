import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_module/domain/use_cases/get_data_use_case.dart';
import 'package:shared/entities/cat_detail_entity.dart';
import 'package:shared/utils/status.dart';

part 'searcher_event.dart';
part 'searcher_state.dart';

class SearcherBloc extends Bloc<SearcherEvent, SearcherState> {
  final GetDataUseCase getDataUseCase;

  SearcherBloc({
    required this.getDataUseCase
  }) : super(const SearcherState()) {
    on<GetDataEvent>(_onGetData);
    on<ClearDataEvent>(_onClearData);
  }

  void _onGetData(GetDataEvent event, Emitter<SearcherState> emit) async {
    emit(state.copyWith(searcherStatus: Status.loading));

    final results = await getDataUseCase.run(event.query);

    results.fold(
      (failure) => emit(
        state.copyWith(
          searcherStatus: Status.error,
          message: failure
        )
      ),
      (success) => emit(
        state.copyWith(
          searchData: success,
          searcherStatus: Status.success
        )
      )
    );
  }

  void _onClearData(ClearDataEvent event, Emitter<SearcherState> emit) async {
    emit(
      state.copyWith(
        searcherStatus: Status.undefined,
        searchData: null
      )
    );


  }
}