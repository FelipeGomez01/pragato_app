import 'package:search_module/data/datasources/search_datasource.dart';
import 'package:search_module/data/repositories/search_repository.dart';
import 'package:search_module/domain/use_cases/get_data_use_case.dart';

class SearchDI {
  SearchDI();

  SearchRepository get searchRepository {
    return SearchRepository(searchDataSource: SearchDataSource());
  }

  GetDataUseCase get getDataUseCase {
    return GetDataUseCase(searchRepository: searchRepository);
  }
}

final SearchDI searchDI = SearchDI();