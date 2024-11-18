import 'dart:async';
import 'package:either_dart/either.dart';
import 'package:shared/entities/base_data_entity.dart';

import '../repositories/i_home_repository.dart';

class GetListUseCase {
  final IHomeRepository homeRepository;

  const GetListUseCase({
    required this.homeRepository
  });

  Future<Either<dynamic, List<BaseDataEntity>>> run() async {
    try{
      final data = await homeRepository.getHomeData();

      return Right(data.right);
    } catch (e){
      return Left(e);
    }
  }
}