import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared/entities/image_entity.dart';

part 'image_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ImageModel extends Equatable {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "width")
  final int width;
  @JsonKey(name: "height")
  final int height;
  @JsonKey(name: "url")
  final String url;

  const ImageModel({
    required this.id,
    required this.width,
    required this.height,
    required this.url
  });

  factory ImageModel.fromJson(Map<String, dynamic> json) =>
      _$ImageModelFromJson(json);

  Map<String, dynamic> toJson() => _$ImageModelToJson(this);

  ImageModel copyWith({
    String? id,
    int? width,
    int? height,
    String? url
  }) =>
      ImageModel(
        id: id ?? this.id,
        width: width ?? this.width,
        height: height ?? this.height,
        url: url ?? this.url,
      );

  @override
  List<Object?> get props => [
    id,
    width,
    height,
    url
  ];
}

extension ImageModelExt on ImageModel {
  ImageEntity toImageEntity() => ImageEntity(
      id: id,
      width: width,
      height: height,
      url: url
  );
}