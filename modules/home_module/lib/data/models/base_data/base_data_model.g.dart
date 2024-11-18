// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseDataModel _$BaseDataModelFromJson(Map<String, dynamic> json) =>
    BaseDataModel(
      id: json['id'] as String,
      url: json['url'] as String,
      width: (json['width'] as num).toInt(),
      height: (json['height'] as num).toInt(),
      catDetailList: (json['breeds'] as List<dynamic>)
          .map((e) => CatDetailModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BaseDataModelToJson(BaseDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'width': instance.width,
      'height': instance.height,
      'breeds': instance.catDetailList.map((e) => e.toJson()).toList(),
    };
