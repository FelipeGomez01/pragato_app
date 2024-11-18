import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:search_module/data/repositories/search_repository.dart';
import 'package:shared/entities/cat_detail_entity.dart';

import '../mocks/mock_search_datasource.mocks.dart';


void main() {
  late MockSearchDataSource mockSearchDataSource;
  late SearchRepository searchRepository;

  setUp(() {
    mockSearchDataSource = MockSearchDataSource();
    searchRepository = SearchRepository(
      searchDataSource: mockSearchDataSource
    );
  });

  group('SearchRepository - getSearchResults', () {
    const query = 'Per';

    test('should return a list of CatDetailEntity when datasource returns valid data', () async {

      final mockResponse = [
        {
          "weight": {
            "imperial": "6 - 10",
            "metric": "3 - 5"
          },
          "id": "lape",
          "name": "LaPerm",
          "cfa_url": "http://cfa.org/Breeds/BreedsKthruR/LaPerm.aspx",
          "vetstreet_url": "http://www.vetstreet.com/cats/laperm",
          "vcahospitals_url": "https://vcahospitals.com/know-your-pet/cat-breeds/laperm",
          "temperament": "Affectionate, Friendly, Gentle, Intelligent, Playful, Quiet",
          "origin": "Thailand",
          "country_codes": "TH",
          "country_code": "TH",
          "description": "LaPerms are gentle and affectionate but also very active. Unlike many active breeds, the LaPerm is also quite content to be a lap cat. The LaPerm will often follow your lead; that is, if they are busy playing and you decide to sit and relax, simply pick up your LaPerm and sit down with it, and it will stay in your lap, devouring the attention you give it.",
          "life_span": "10 - 15",
          "indoor": 0,
          "lap": 1,
          "alt_names": "Si-Sawat",
          "adaptability": 5,
          "affection_level": 5,
          "child_friendly": 4,
          "dog_friendly": 5,
          "energy_level": 4,
          "grooming": 1,
          "health_issues": 1,
          "intelligence": 5,
          "shedding_level": 3,
          "social_needs": 4,
          "stranger_friendly": 4,
          "vocalisation": 3,
          "experimental": 0,
          "hairless": 0,
          "natural": 0,
          "rare": 0,
          "rex": 1,
          "suppressed_tail": 0,
          "short_legs": 0,
          "wikipedia_url": "https://en.wikipedia.org/wiki/LaPerm",
          "hypoallergenic": 1,
          "reference_image_id": "aKbsEYjSl",
          "image": {
            "id": "aKbsEYjSl",
            "width": 1074,
            "height": 890,
            "url": "https://cdn2.thecatapi.com/images/aKbsEYjSl.jpg"
          }
        },
        {
          "weight": {
            "imperial": "9 - 14",
            "metric": "4 - 6"
          },
          "id": "pers",
          "name": "Persian",
          "cfa_url": "http://cfa.org/Breeds/BreedsKthruR/Persian.aspx",
          "vetstreet_url": "http://www.vetstreet.com/cats/persian",
          "vcahospitals_url": "https://vcahospitals.com/know-your-pet/cat-breeds/persian",
          "temperament": "Affectionate, loyal, Sedate, Quiet",
          "origin": "Iran (Persia)",
          "country_codes": "IR",
          "country_code": "IR",
          "description": "Persians are sweet, gentle cats that can be playful or quiet and laid-back. Great with families and children, they absolutely love to lounge around the house. While they don’t mind a full house or active kids, they’ll usually hide when they need some alone time.",
          "life_span": "14 - 15",
          "indoor": 0,
          "lap": 1,
          "alt_names": "Longhair, Persian Longhair, Shiraz, Shirazi",
          "adaptability": 5,
          "affection_level": 5,
          "child_friendly": 2,
          "dog_friendly": 2,
          "energy_level": 1,
          "grooming": 5,
          "health_issues": 3,
          "intelligence": 3,
          "shedding_level": 4,
          "social_needs": 4,
          "stranger_friendly": 2,
          "vocalisation": 1,
          "experimental": 0,
          "hairless": 0,
          "natural": 1,
          "rare": 0,
          "rex": 0,
          "suppressed_tail": 0,
          "short_legs": 0,
          "wikipedia_url": "https://en.wikipedia.org/wiki/Persian_(cat)",
          "hypoallergenic": 0,
          "reference_image_id": "-Zfz5z2jK",
          "image": {
            "id": "-Zfz5z2jK",
            "width": 1691,
            "height": 1123,
            "url": "https://cdn2.thecatapi.com/images/-Zfz5z2jK.jpg"
          }
        }
      ];

      when(mockSearchDataSource.getSearchResults(query)).thenAnswer((_) async => mockResponse);

      // Act
      final result = await searchRepository.getSearchResults(query);

      // Assert
      expect(result.isRight, true);
      final data = result.right;
      expect(data, isA<List<CatDetailEntity>>());
      expect(data.length, 2);
      verify(mockSearchDataSource.getSearchResults(query)).called(1);
    });

    test('should return Left with error message when datasource throws an exception', () async {
      // Arrange
      when(mockSearchDataSource.getSearchResults('Per')).thenThrow(Exception("Error fetching data"));

      // Act
      final result = await searchRepository.getSearchResults(query);

      // Assert
      expect(result.isLeft, true);
      expect(result.left, "Exception: Error fetching data");
      verify(mockSearchDataSource.getSearchResults(query)).called(1);
    });
  });
}