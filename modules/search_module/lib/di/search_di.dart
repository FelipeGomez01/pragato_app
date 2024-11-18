import 'package:home_module/data/repositories/home_repository.dart';
import 'package:home_module/domain/use_cases/get_list_use_case.dart';

class HomeUseCaseDI{
  HomeUseCaseDI();

  GetListUseCase get getListUseCase {
    return GetListUseCase(homeRepository: HomeRepository());
  }
}

final HomeUseCaseDI homeDI = HomeUseCaseDI();