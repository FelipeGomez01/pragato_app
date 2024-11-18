import 'package:home_module/data/datasources/home_datasource.dart';
import 'package:home_module/data/repositories/home_repository.dart';
import 'package:home_module/domain/use_cases/get_list_use_case.dart';

class HomeDI {
  HomeDI();

  HomeRepository get homeRepository {
    return HomeRepository(homeDataSource: HomeDataSource());
  }

  GetListUseCase get getListUseCase {
    return GetListUseCase(homeRepository: homeRepository);
  }
}

final HomeDI homeDI = HomeDI();