import 'package:either_dart/either.dart';
import 'package:search_module/data/datasources/search_datasource.dart';
import 'package:search_module/domain/repositories/i_search_repository.dart';
import 'package:shared/entities/cat_detail_entity.dart';
import 'package:shared/models/cat_detail_model/cat_detail_model.dart';

class SearchRepository implements ISearchRepository {
  final SearchDataSource searchDataSource;

  const SearchRepository({
    required this.searchDataSource
  });

  @override
  Future<Either<dynamic, List<CatDetailEntity>>> getSearchResults(String query) async {
    try{
      final data = await searchDataSource.getSearchResults(query);

      final list = data.map<CatDetailEntity>(
        (item) => CatDetailModel.fromJson(item).toCatDetailEntity()
      ).toList();

      return Right(list);
    } catch(e) {
      return Left(e.toString());
    }
  }
}