import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  final String url;

  const ImageWidget({
    super.key,
    required this.url
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ClipRRect(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        borderRadius: BorderRadius.circular(5),
        child: Image.network(
          url,
          loadingBuilder: (_, child, progress) {
            if (progress == null) return child;
            return const Icon(
              Icons.hourglass_top,
              size: 60
            );
          }
        )
      )
    );
  }
}