import 'package:equatable/equatable.dart';
import 'package:shared/entities/cat_detail_entity.dart';

class BaseDataEntity extends Equatable {
  final String id;
  final String url;
  final int width;
  final int height;
  final List<CatDetailEntity> catDetailList;

  const BaseDataEntity({
    required this.id,
    required this.url,
    required this.width,
    required this.height,
    required this.catDetailList,
  });

  BaseDataEntity copyWith({
    String? id,
    String? url,
    int? width,
    int? height,
    List<CatDetailEntity>? catDetailList,
  }) =>
      BaseDataEntity(
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
