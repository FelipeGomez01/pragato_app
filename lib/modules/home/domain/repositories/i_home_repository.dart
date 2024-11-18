import '../../../../core/domain/entities/type_service_entity.dart';
import '../entities/home_entity.dart';

abstract class IHomeRepository {
  Future<HomeEntity> getHomeData();

  Future<List<TypeServiceEntity>> searchService();
}