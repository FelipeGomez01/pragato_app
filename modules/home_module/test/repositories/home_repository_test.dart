import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:home_module/data/repositories/home_repository.dart';
import 'package:home_module/domain/entities/base_data_entity.dart';
import '../mocks/mock_home_datasource.mocks.dart';


void main() {
  late MockHomeDataSource mockHomeDataSource;
  late HomeRepository homeRepository;

  setUp(() {
    mockHomeDataSource = MockHomeDataSource();
    homeRepository = HomeRepository(
      homeDataSource: mockHomeDataSource
    );
  });

  group('HomeRepository - getHomeData', () {
    test('should return a list of BaseDataEntity when datasource returns valid data', () async {
      // Arrange
      final mockResponse = [
        {
          "breeds": [
            {
              "weight": {
                "imperial": "7  -  10",
                "metric": "3 - 5"
              },
              "id": "abys",
              "name": "Abyssinian",
              "cfa_url": "http://cfa.org/Breeds/BreedsAB/Abyssinian.aspx",
              "vetstreet_url": "http://www.vetstreet.com/cats/abyssinian",
              "vcahospitals_url": "https://vcahospitals.com/know-your-pet/cat-breeds/abyssinian",
              "temperament": "Active, Energetic, Independent, Intelligent, Gentle",
              "origin": "Egypt",
              "country_codes": "EG",
              "country_code": "EG",
              "description": "The Abyssinian is easy to care for, and a joy to have in your home. They’re affectionate cats and love both people and other animals.",
              "life_span": "14 - 15",
              "indoor": 0,
              "lap": 1,
              "alt_names": "",
              "adaptability": 5,
              "affection_level": 5,
              "child_friendly": 3,
              "dog_friendly": 4,
              "energy_level": 5,
              "grooming": 1,
              "health_issues": 2,
              "intelligence": 5,
              "shedding_level": 2,
              "social_needs": 5,
              "stranger_friendly": 5,
              "vocalisation": 1,
              "experimental": 0,
              "hairless": 0,
              "natural": 1,
              "rare": 0,
              "rex": 0,
              "suppressed_tail": 0,
              "short_legs": 0,
              "wikipedia_url": "https://en.wikipedia.org/wiki/Abyssinian_(cat)",
              "hypoallergenic": 0,
              "reference_image_id": "0XYvRd7oD"
            }
          ],
          "id": "0XYvRd7oD",
          "url": "https://cdn2.thecatapi.com/images/0XYvRd7oD.jpg",
          "width": 1204,
          "height": 1445
        },
        {
          "breeds": [
            {
              "weight": {
                "imperial": "4 - 10",
                "metric": "2 - 5"
              },
              "id": "bali",
              "name": "Balinese",
              "cfa_url": "http://cfa.org/Breeds/BreedsAB/Balinese.aspx",
              "vetstreet_url": "http://www.vetstreet.com/cats/balinese",
              "vcahospitals_url": "https://vcahospitals.com/know-your-pet/cat-breeds/balinese",
              "temperament": "Affectionate, Intelligent, Playful",
              "origin": "United States",
              "country_codes": "US",
              "country_code": "US",
              "description": "Balinese are curious, outgoing, intelligent cats with excellent communication skills. They are known for their chatty personalities and are always eager to tell you their views on life, love, and what you’ve served them for dinner. ",
              "life_span": "10 - 15",
              "indoor": 0,
              "alt_names": "Long-haired Siamese",
              "adaptability": 5,
              "affection_level": 5,
              "child_friendly": 4,
              "dog_friendly": 5,
              "energy_level": 5,
              "grooming": 3,
              "health_issues": 3,
              "intelligence": 5,
              "shedding_level": 3,
              "social_needs": 5,
              "stranger_friendly": 5,
              "vocalisation": 5,
              "experimental": 0,
              "hairless": 0,
              "natural": 0,
              "rare": 0,
              "rex": 0,
              "suppressed_tail": 0,
              "short_legs": 0,
              "wikipedia_url": "https://en.wikipedia.org/wiki/Balinese_(cat)",
              "hypoallergenic": 1,
              "reference_image_id": "13MkvUreZ"
            }
          ],
          "id": "DBmIBhhyv",
          "url": "https://cdn2.thecatapi.com/images/DBmIBhhyv.jpg",
          "width": 1220,
          "height": 915
        }
      ];

      when(mockHomeDataSource.getDataList()).thenAnswer((_) async => mockResponse);

      // Act
      final result = await homeRepository.getHomeData();

      // Assert
      expect(result.isRight, true);
      final data = result.right;
      expect(data, isA<List<BaseDataEntity>>());
      expect(data.length, 2);
      verify(mockHomeDataSource.getDataList()).called(1);
    });

    test('should return Left with error message when datasource throws an exception', () async {
      // Arrange
      when(mockHomeDataSource.getDataList()).thenThrow(Exception("Error fetching data"));

      // Act
      final result = await homeRepository.getHomeData();

      // Assert
      expect(result.isLeft, true);
      expect(result.left, "Exception: Error fetching data");
      verify(mockHomeDataSource.getDataList()).called(1);
    });
  });
}