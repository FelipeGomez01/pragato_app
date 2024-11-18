import 'package:core_ui/l10n/core_ui_localizations_extension.dart';
import 'package:core_ui/resources/app_colors.dart';
import 'package:core_ui/resources/text_styles.dart';
import 'package:core_ui/widgets/image_widget.dart';
import 'package:flutter/material.dart';

class InfoCardWidget extends StatelessWidget {
  final VoidCallback navTo;
  final String name;
  final String imageUrl;
  final String countryOrigin;
  final int intelligence;
  
  const InfoCardWidget({
    super.key,
    required this.navTo,
    required this.name,
    required this.imageUrl,
    required this.countryOrigin,
    required this.intelligence
  });

  @override
  Widget build(BuildContext context) {
    final titleText = CustomTextStyles.title.copyWith(
      color: AppColors.secondary
    );
    final secondaryText = CustomTextStyles.description.copyWith(
      color: AppColors.secondary
    );

    return InkWell(
      onTap: () => navTo(),
      child: Card(
        color: AppColors.tertiary,
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    name,
                    style: titleText
                  ),
                  Text(
                    context.coreUiL10n.more,
                    style: titleText
                  )
                ]
              ),
              const SizedBox(height: 10),
              ImageWidget(
                url: imageUrl
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      '${context.coreUiL10n.countryOrigin}: $countryOrigin',
                      style: secondaryText,
                      overflow: TextOverflow.ellipsis
                    )
                  ),
                  Text(
                    '${context.coreUiL10n.intelligence}: $intelligence',
                    style: secondaryText
                  )
                ]
              )
            ]
          )
        )
      )
    );
  }
}