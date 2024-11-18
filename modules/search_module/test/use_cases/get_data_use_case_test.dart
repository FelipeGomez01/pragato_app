import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:either_dart/either.dart';
import 'package:search_module/domain/use_cases/get_data_use_case.dart';
import 'package:shared/entities/cat_detail_entity.dart';
import 'package:shared/entities/image_entity.dart';
import 'package:shared/entities/weight_entity.dart';
import '../mocks/mock_search_repository.mocks.dart';

void main() {
  late MockISearchRepository mockISearchRepository;
  late GetDataUseCase getDataUseCase;

  setUpAll(() {
    provideDummy<Either<dynamic, List<CatDetailEntity>>>(const Right([]));
  });

  setUp(() {
    mockISearchRepository = MockISearchRepository();
    getDataUseCase = GetDataUseCase(searchRepository: mockISearchRepository);
  });

  group('GetDataUseCase', () {
    const query = 'Per';
    test('should return a list of CatDetailEntity when repository returns data', () async {

      const mockData = [
        CatDetailEntity(
          weight: WeightEntity(imperial: "9 - 14", metric: "4 - 6"),
          id: "pers",
          name: "Persian",
          cfaUrl: "http://cfa.org/Breeds/BreedsKthruR/Persian.aspx",
          vetstreetUrl: "http://www.vetstreet.com/cats/persian",
          vcahospitalsUrl: "https://vcahospitals.com/know-your-pet/cat-breeds/persian",
          temperament: "Affectionate, loyal, Sedate, Quiet",
          origin: "Iran (Persia)",
          countryCodes: "IR",
          countryCode: "IR",
          description:
          "Persians are sweet, gentle cats that can be playful or quiet and laid-back. Great with families and children, they absolutely love to lounge around the house. While they don’t mind a full house or active kids, they’ll usually hide when they need some alone time.",
          lifeSpan: "14 - 15",
          indoor: 0,
          lap: 1,
          altNames: "Longhair, Persian Longhair, Shiraz, Shirazi",
          adaptability: 5,
          affectionLevel: 5,
          childFriendly: 2,
          dogFriendly: 2,
          energyLevel: 1,
          grooming: 5,
          healthIssues: 3,
          intelligence: 3,
          sheddingLevel: 4,
          socialNeeds: 4,
          strangerFriendly: 2,
          vocalisation: 1,
          experimental: 0,
          hairless: 0,
          natural: 1,
          rare: 0,
          rex: 0,
          suppressedTail: 0,
          shortLegs: 0,
          wikipediaUrl: "https://en.wikipedia.org/wiki/Persian_(cat)",
          hypoallergenic: 0,
          referenceImageId: "-Zfz5z2jK",
          image: ImageEntity(
            id: "-Zfz5z2jK",
            width: 1691,
            height: 1123,
            url: "https://cdn2.thecatapi.com/images/-Zfz5z2jK.jpg",
          ),
          fullImageUrl: null,
        ),
        CatDetailEntity(
          weight: WeightEntity(imperial: "6 - 10", metric: "3 - 5"),
          id: "lape",
          name: "LaPerm",
          cfaUrl: "http://cfa.org/Breeds/BreedsKthruR/LaPerm.aspx",
          vetstreetUrl: "http://www.vetstreet.com/cats/laperm",
          vcahospitalsUrl: "https://vcahospitals.com/know-your-pet/cat-breeds/laperm",
          temperament: "Affectionate, Friendly, Gentle, Intelligent, Playful, Quiet",
          origin: "Thailand",
          countryCodes: "TH",
          countryCode: "TH",
          description:
          "LaPerms are gentle and affectionate but also very active. Unlike many active breeds, the LaPerm is also quite content to be a lap cat. The LaPerm will often follow your lead; that is, if they are busy playing and you decide to sit and relax, simply pick up your LaPerm and sit down with it, and it will stay in your lap, devouring the attention you give it.",
          lifeSpan: "10 - 15",
          indoor: 0,
          lap: 1,
          altNames: "Si-Sawat",
          adaptability: 5,
          affectionLevel: 5,
          childFriendly: 4,
          dogFriendly: 5,
          energyLevel: 4,
          grooming: 1,
          healthIssues: 1,
          intelligence: 5,
          sheddingLevel: 3,
          socialNeeds: 4,
          strangerFriendly: 4,
          vocalisation: 3,
          experimental: 0,
          hairless: 0,
          natural: 0,
          rare: 0,
          rex: 1,
          suppressedTail: 0,
          shortLegs: 0,
          wikipediaUrl: "https://en.wikipedia.org/wiki/LaPerm",
          hypoallergenic: 1,
          referenceImageId: "aKbsEYjSl",
          image: ImageEntity(
            id: "aKbsEYjSl",
            width: 1074,
            height: 890,
            url: "https://cdn2.thecatapi.com/images/aKbsEYjSl.jpg",
          ),
          fullImageUrl: null,
        )
      ];
      when(mockISearchRepository.getSearchResults(query)).thenAnswer((_) async => const Right(mockData));

      // Act
      final result = await getDataUseCase.run(query);

      // Assert
      expect(result.isRight, true);
      expect(result.right, mockData);
      verify(mockISearchRepository.getSearchResults(query)).called(1);
    });

    test('should return Left with error when repository throws an exception', () async {
      // Arrange
      when(mockISearchRepository.getSearchResults(query)).thenThrow(Exception('Repository error'));

      // Act
      final result = await getDataUseCase.run(query);

      // Assert
      expect(result.isLeft, true);
      expect(result.left.toString(), contains('Exception: Repository error'));
      verify(mockISearchRepository.getSearchResults(query)).called(1);
    });
  });
}