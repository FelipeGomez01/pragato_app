import 'package:core_ui/resources/text_styles.dart';
import 'package:flutter/material.dart';

class RowWidget extends StatelessWidget {
  final String title;
  final String value;

  const RowWidget({
    super.key,
    required this.title,
    required this.value
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$title:',
          style: CustomTextStyles.description.copyWith(
            fontSize: 17
          )
        ),
        const SizedBox(width: 10),
        Text(
          value,
          style: CustomTextStyles.description.copyWith(
            fontSize: 17
          )
        )
      ]
    );
  }
}