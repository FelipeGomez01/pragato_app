import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared/entities/base_data_entity.dart';
import 'package:shared/models/cat_detail_model/cat_detail_model.dart';

part 'base_data_model.g.dart';

@JsonSerializable(
  explicitToJson: true,
  fieldRename: FieldRename.snake
)
class BaseDataModel extends Equatable {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "url")
  final String url;
  @JsonKey(name: "width")
  final int width;
  @JsonKey(name: "height")
  final int height;
  @JsonKey(name: "breeds")
  final List<CatDetailModel> catDetailList;

  const BaseDataModel({
    required this.id,
    required this.url,
    required this.width,
    required this.height,
    required this.catDetailList
  });

  factory BaseDataModel.fromJson(Map<String, dynamic> json) =>
      _$BaseDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$BaseDataModelToJson(this);

  BaseDataModel copyWith({
    String? id,
    String? url,
    int? width,
    int? height,
    List<CatDetailModel>? catDetailList,
  }) =>
      BaseDataModel(
          id: id ?? this.id,
          url: url ?? this.url,
          width: width ?? this.width,
          height: height ?? this.height,
          catDetailList: catDetailList ?? this.catDetailList
      );

  @override
  List<Object?> get props => [
    id,
    url,
    width,
    height,
    catDetailList
  ];
}

extension BaseDataModelExt on BaseDataModel {
  BaseDataEntity toBaseDataEntity() => BaseDataEntity(
    id: id,
    url: url,
    width: width,
    height: height,
    catDetailList: catDetailList.map(
      (item) => item.toCatDetailEntity(fullImageUrl: url)
    ).toList()
  );
}