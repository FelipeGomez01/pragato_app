import 'dart:async';
import 'package:dartz/dartz.dart';
import '../../../../core/utils/failure.dart';
import '../entities/home_entity.dart';
import '../repositories/i_home_repository.dart';

class HomeUseCase {
  final IHomeRepository _homeRepository;

  const HomeUseCase(this._homeRepository);

  Future<Either<Failure, HomeEntity>> getData() async {
    try{
      return Right(await _homeRepository.getHomeData());
    } catch (e){
      return Left(Failure.fromException(e));
    }
  }

  Future<Either<Failure, HomeEntity>> searchService() async {
    try{
      return Right(await _homeRepository.getHomeData());
    } catch (e){
      return Left(Failure.fromException(e));
    }
  }
}