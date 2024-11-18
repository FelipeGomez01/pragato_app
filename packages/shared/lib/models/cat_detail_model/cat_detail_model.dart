import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared/entities/cat_detail_entity.dart';
import 'package:shared/models/image/image_model.dart';
import 'package:shared/models/weight_model/weight_model.dart';

part 'cat_detail_model.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake
)
class CatDetailModel extends Equatable {
  @JsonKey(name: "weight")
  final WeightModel weight;
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "cfa_url")
  final String? cfaUrl;
  @JsonKey(name: "vetstreet_url")
  final String? vetstreetUrl;
  @JsonKey(name: "vcahospitals_url")
  final String? vcahospitalsUrl;
  @JsonKey(name: "temperament")
  final String temperament;
  @JsonKey(name: "origin")
  final String origin;
  @JsonKey(name: "country_codes")
  final String countryCodes;
  @JsonKey(name: "country_code")
  final String countryCode;
  @JsonKey(name: "description")
  final String description;
  @JsonKey(name: "life_span")
  final String lifeSpan;
  @JsonKey(name: "indoor")
  final int indoor;
  @JsonKey(name: "lap")
  final int? lap;
  @JsonKey(name: "alt_names")
  final String? altNames;
  @JsonKey(name: "adaptability")
  final int adaptability;
  @JsonKey(name: "affection_level")
  final int affectionLevel;
  @JsonKey(name: "child_friendly")
  final int childFriendly;
  @JsonKey(name: "dog_friendly")
  final int dogFriendly;
  @JsonKey(name: "energy_level")
  final int energyLevel;
  @JsonKey(name: "grooming")
  final int grooming;
  @JsonKey(name: "health_issues")
  final int healthIssues;
  @JsonKey(name: "intelligence")
  final int intelligence;
  @JsonKey(name: "shedding_level")
  final int sheddingLevel;
  @JsonKey(name: "social_needs")
  final int socialNeeds;
  @JsonKey(name: "stranger_friendly")
  final int strangerFriendly;
  @JsonKey(name: "vocalisation")
  final int vocalisation;
  @JsonKey(name: "experimental")
  final int experimental;
  @JsonKey(name: "hairless")
  final int hairless;
  @JsonKey(name: "natural")
  final int natural;
  @JsonKey(name: "rare")
  final int rare;
  @JsonKey(name: "rex")
  final int rex;
  @JsonKey(name: "suppressed_tail")
  final int suppressedTail;
  @JsonKey(name: "short_legs")
  final int? shortLegs;
  @JsonKey(name: "wikipedia_url")
  final String? wikipediaUrl;
  @JsonKey(name: "hypoallergenic")
  final int hypoallergenic;
  @JsonKey(name: "reference_image_id")
  final String? referenceImageId;
  @JsonKey(name: "image")
  final ImageModel? image;

  const CatDetailModel({
    required this.weight,
    required this.id,
    required this.name,
    required this.cfaUrl,
    required this.vetstreetUrl,
    required this.vcahospitalsUrl,
    required this.temperament,
    required this.origin,
    required this.countryCodes,
    required this.countryCode,
    required this.description,
    required this.lifeSpan,
    required this.indoor,
    required this.lap,
    required this.altNames,
    required this.adaptability,
    required this.affectionLevel,
    required this.childFriendly,
    required this.dogFriendly,
    required this.energyLevel,
    required this.grooming,
    required this.healthIssues,
    required this.intelligence,
    required this.sheddingLevel,
    required this.socialNeeds,
    required this.strangerFriendly,
    required this.vocalisation,
    required this.experimental,
    required this.hairless,
    required this.natural,
    required this.rare,
    required this.rex,
    required this.suppressedTail,
    required this.shortLegs,
    required this.wikipediaUrl,
    required this.hypoallergenic,
    required this.referenceImageId,
    this.image
  });

  factory CatDetailModel.fromJson(Map<String, dynamic> json) =>
      _$CatDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$CatDetailModelToJson(this);

  CatDetailModel copyWith({
    WeightModel? weight,
    String? id,
    String? name,
    String? cfaUrl,
    String? vetstreetUrl,
    String? vcahospitalsUrl,
    String? temperament,
    String? origin,
    String? countryCodes,
    String? countryCode,
    String? description,
    String? lifeSpan,
    int? indoor,
    int? lap,
    String? altNames,
    int? adaptability,
    int? affectionLevel,
    int? childFriendly,
    int? dogFriendly,
    int? energyLevel,
    int? grooming,
    int? healthIssues,
    int? intelligence,
    int? sheddingLevel,
    int? socialNeeds,
    int? strangerFriendly,
    int? vocalisation,
    int? experimental,
    int? hairless,
    int? natural,
    int? rare,
    int? rex,
    int? suppressedTail,
    int? shortLegs,
    String? wikipediaUrl,
    int? hypoallergenic,
    String? referenceImageId,
    ImageModel? image
  }) =>
      CatDetailModel(
        weight: weight ?? this.weight,
        id: id ?? this.id,
        name: name ?? this.name,
        cfaUrl: cfaUrl ?? this.cfaUrl,
        vetstreetUrl: vetstreetUrl ?? this.vetstreetUrl,
        vcahospitalsUrl: vcahospitalsUrl ?? this.vcahospitalsUrl,
        temperament: temperament ?? this.temperament,
        origin: origin ?? this.origin,
        countryCodes: countryCodes ?? this.countryCodes,
        countryCode: countryCode ?? this.countryCode,
        description: description ?? this.description,
        lifeSpan: lifeSpan ?? this.lifeSpan,
        indoor: indoor ?? this.indoor,
        lap: lap ?? this.lap,
        altNames: altNames ?? this.altNames,
        adaptability: adaptability ?? this.adaptability,
        affectionLevel: affectionLevel ?? this.affectionLevel,
        childFriendly: childFriendly ?? this.childFriendly,
        dogFriendly: dogFriendly ?? this.dogFriendly,
        energyLevel: energyLevel ?? this.energyLevel,
        grooming: grooming ?? this.grooming,
        healthIssues: healthIssues ?? this.healthIssues,
        intelligence: intelligence ?? this.intelligence,
        sheddingLevel: sheddingLevel ?? this.sheddingLevel,
        socialNeeds: socialNeeds ?? this.socialNeeds,
        strangerFriendly: strangerFriendly ?? this.strangerFriendly,
        vocalisation: vocalisation ?? this.vocalisation,
        experimental: experimental ?? this.experimental,
        hairless: hairless ?? this.hairless,
        natural: natural ?? this.natural,
        rare: rare ?? this.rare,
        rex: rex ?? this.rex,
        suppressedTail: suppressedTail ?? this.suppressedTail,
        shortLegs: shortLegs ?? this.shortLegs,
        wikipediaUrl: wikipediaUrl ?? this.wikipediaUrl,
        hypoallergenic: hypoallergenic ?? this.hypoallergenic,
        referenceImageId: referenceImageId ?? this.referenceImageId,
        image: image ?? this.image,
      );

  @override
  List<Object?> get props => [
    weight,
    id,
    name,
    cfaUrl,
    vetstreetUrl,
    vcahospitalsUrl,
    temperament,
    origin,
    countryCodes,
    countryCode,
    description,
    lifeSpan,
    indoor,
    lap,
    altNames,
    adaptability,
    affectionLevel,
    childFriendly,
    dogFriendly,
    energyLevel,
    grooming,
    healthIssues,
    intelligence,
    sheddingLevel,
    socialNeeds,
    strangerFriendly,
    vocalisation,
    experimental,
    hairless,
    natural,
    rare,
    rex,
    suppressedTail,
    shortLegs,
    wikipediaUrl,
    hypoallergenic,
    referenceImageId,
    image
  ];
}

extension CatDetailModelExt on CatDetailModel {
  CatDetailEntity toCatDetailEntity({String? fullImageUrl}) => CatDetailEntity(
    weight: weight.toWeightEntity(),
    id: id,
    name: name,
    cfaUrl: cfaUrl,
    vetstreetUrl: vetstreetUrl,
    vcahospitalsUrl: vcahospitalsUrl,
    temperament: temperament,
    origin: origin,
    countryCodes: countryCodes,
    countryCode: countryCode,
    description: description,
    lifeSpan: lifeSpan,
    indoor: indoor,
    lap: lap,
    altNames: altNames,
    adaptability: adaptability,
    affectionLevel: affectionLevel,
    childFriendly: childFriendly,
    dogFriendly: dogFriendly,
    energyLevel: energyLevel,
    grooming: grooming,
    healthIssues: healthIssues,
    intelligence: intelligence,
    sheddingLevel: sheddingLevel,
    socialNeeds: socialNeeds,
    strangerFriendly: strangerFriendly,
    vocalisation: vocalisation,
    experimental: this.experimental,
    hairless: hairless,
    natural: natural,
    rare: rare,
    rex: rex,
    suppressedTail: suppressedTail,
    shortLegs: shortLegs,
    wikipediaUrl: wikipediaUrl,
    hypoallergenic: hypoallergenic,
    referenceImageId: referenceImageId,
    fullImageUrl: fullImageUrl,
    image: image?.toImageEntity()
  );
}