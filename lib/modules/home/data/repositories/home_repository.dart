import '../../../../core/domain/entities/type_service_entity.dart';
import '../../domain/repositories/i_home_repository.dart';
import '../data_sources/home_data_source.dart';
import '../models/home_model.dart';

class HomeRepository implements IHomeRepository {
  final _homeDataSource = HomeDataSource();

  @override
  Future<HomeModel> getHomeData() async {
    try{
      return HomeModel.fromMap(await _homeDataSource.getDataHome());
    }catch(e){
      rethrow;
    }
  }

  @override
  Future<List<TypeServiceEntity>> searchService() {
    // TODO: implement searchService
    throw UnimplementedError();
  }
}