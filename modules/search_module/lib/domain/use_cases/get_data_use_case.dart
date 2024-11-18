import 'dart:async';
import 'package:either_dart/either.dart';
import 'package:search_module/domain/repositories/i_search_repository.dart';
import 'package:shared/entities/cat_detail_entity.dart';

class GetDataUseCase {
  final ISearchRepository searchRepository;

  const GetDataUseCase({
    required this.searchRepository
  });

  Future<Either<dynamic, List<CatDetailEntity>>> run(String query) async {
    try{
      final data = await searchRepository.getSearchResults(query);

      return Right(data.right);
    } catch (e){
      return Left(e);
    }
  }
}