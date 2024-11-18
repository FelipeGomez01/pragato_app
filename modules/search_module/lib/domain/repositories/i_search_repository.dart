import 'package:either_dart/either.dart';
import 'package:shared/entities/cat_detail_entity.dart';

abstract class ISearchRepository {
  Future<Either<dynamic, List<CatDetailEntity>>> getSearchResults(String query);
}