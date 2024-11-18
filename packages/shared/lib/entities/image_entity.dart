import 'package:equatable/equatable.dart';

class ImageEntity extends Equatable {
  final String id;
  final int width;
  final int height;
  final String url;

  const ImageEntity({
    required this.id,
    required this.width,
    required this.height,
    required this.url
  });

  @override
  List<Object?> get props => [
    id,
    url,
    width,
    height
  ];
}
