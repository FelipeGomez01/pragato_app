// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageModel _$ImageModelFromJson(Map<String, dynamic> json) => ImageModel(
      id: json['id'] as String,
      width: (json['width'] as num).toInt(),
      height: (json['height'] as num).toInt(),
      url: json['url'] as String,
    );

Map<String, dynamic> _$ImageModelToJson(ImageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'width': instance.width,
      'height': instance.height,
      'url': instance.url,
    };
