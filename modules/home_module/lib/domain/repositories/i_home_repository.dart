import 'package:either_dart/either.dart';
import 'package:home_module/domain/entities/base_data_entity.dart';

abstract class IHomeRepository {
  Future<Either<dynamic, List<BaseDataEntity>>> getHomeData();
}