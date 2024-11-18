import 'dart:developer';

import 'package:either_dart/either.dart';
import 'package:home_module/data/datasources/home_datasource.dart';
import 'package:home_module/data/models/base_data_model.dart';
import 'package:home_module/domain/entities/base_data_entity.dart';
import 'package:home_module/domain/repositories/i_home_repository.dart';

class HomeRepository implements IHomeRepository {
  final _homeDataSource = HomeDataSource();

  @override
  Future<Either<dynamic, List<BaseDataEntity>>> getHomeData() async {
    try{
      final data = await _homeDataSource.getDataList();

      final list = data.map<BaseDataEntity>(
        (item) => BaseDataModel.fromJson(item).toBaseDataEntity()
      ).toList();

      return Right(list);
    } catch(e) {
      print('repository: $e');
      return Left(e.toString());
    }
  }
}