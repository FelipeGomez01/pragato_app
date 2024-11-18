import 'dart:async';
import '../../../../core/utils/debounce.dart';
import '../../domain/entities/home_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/enums/status.dart';
import '../../domain/use_cases/home_use_case.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
   HomeBloc({
    required this.homeUseCase
  }) : super(const HomeState()) {
    on<LoadHomeEvent>(_onLoadHome);
  }

  final HomeUseCase homeUseCase;
  final StreamController<List> _suggestionStreamController = StreamController.broadcast();
  Stream<List> get suggestionStream => _suggestionStreamController.stream;
   final debounce = Debounce(duration: const Duration(milliseconds: 500));

  void _onLoadHome(LoadHomeEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(homeStatus: Status.loading));

    final homeData = await homeUseCase.getData();

    homeData.fold(
      (error) => emit(
        state.copyWith(
          homeStatus: Status.error,
          message: error.message
        )
      ),
      (homeEntity) => emit(
        state.copyWith(
          homeEntity: homeEntity,
          homeStatus: Status.success
        )
      )
    );
  }

  void getSuggestionsByQuery(String searchTerm) async
  {
    debounce.value = '';
    /*debounce.onValue = (value) async
    {
      final results = await homeUseCase.searchService(value);
      _suggestionStreamController.add(results);
    };*/

    final timer = Timer.periodic(const Duration(milliseconds: 300), ( _ ) {
      debounce.value = searchTerm;
    });

    Future.delayed(const Duration(milliseconds: 301)).then(( _ ) => timer.cancel());
  }
}