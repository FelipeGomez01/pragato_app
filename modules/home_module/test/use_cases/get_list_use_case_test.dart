import 'package:flutter_test/flutter_test.dart';
import 'package:home_module/domain/use_cases/get_list_use_case.dart';
import 'package:mockito/mockito.dart';
import 'package:home_module/domain/entities/base_data_entity.dart';
import 'package:either_dart/either.dart';

import '../mocks/mock_home_repository.mocks.dart';

void main() {
  late MockIHomeRepository mockHomeRepository;
  late GetListUseCase getListUseCase;

  setUpAll(() {
    provideDummy<Either<dynamic, List<BaseDataEntity>>>(const Right([]));
  });

  setUp(() {
    mockHomeRepository = MockIHomeRepository();
    getListUseCase = GetListUseCase(homeRepository: mockHomeRepository);
  });

  group('GetListUseCase', () {
    test('should return a list of BaseDataEntity when repository returns data', () async {

      // Arrange
      const mockData = [
        BaseDataEntity(
          id: "0XYvRd7oD",
          url: "https://cdn2.thecatapi.com/images/0XYvRd7oD.jpg",
          width: 1204,
          height: 1445,
          catDetailList: [],
        ),
        BaseDataEntity(
          id: "DBmIBhhyv",
          url: "https://cdn2.thecatapi.com/images/DBmIBhhyv.jpg",
          width: 1220,
          height: 915,
          catDetailList: [],
        )
      ];
      when(mockHomeRepository.getHomeData()).thenAnswer((_) async => const Right(mockData));

      // Act
      final result = await getListUseCase.run();

      // Assert
      expect(result.isRight, true);
      expect(result.right, mockData);
      verify(mockHomeRepository.getHomeData()).called(1);
    });

    test('should return Left with error when repository throws an exception', () async {
      // Arrange
      when(mockHomeRepository.getHomeData()).thenThrow(Exception('Repository error'));

      // Act
      final result = await getListUseCase.run();

      // Assert
      expect(result.isLeft, true);
      expect(result.left.toString(), contains('Exception: Repository error'));
      verify(mockHomeRepository.getHomeData()).called(1);
    });
  });
}