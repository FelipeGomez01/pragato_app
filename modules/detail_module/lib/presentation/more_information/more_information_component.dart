import 'package:core_ui/resources/app_colors.dart';
import 'package:core_ui/resources/text_styles.dart';
import 'package:core_ui/widgets/image_widget.dart';
import 'package:detail_module/l10n/detail_localizations_extension.dart';
import 'package:detail_module/presentation/more_information/row_widget.dart';
import 'package:flutter/material.dart';
import 'package:shared/entities/cat_detail_entity.dart';

class MoreInformationComponent extends StatelessWidget {
  final CatDetailEntity catDetail;

  const MoreInformationComponent({
    super.key,
    required this.catDetail,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.tertiary,
      child: Column(
        children: [
          ImageWidget(url: catDetail.image?.url ?? catDetail.fullImageUrl!),
          const SizedBox(height: 5),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              children: [
                Text(
                  catDetail.description,
                  style: CustomTextStyles.title
                ),
                const SizedBox(height: 20),
                RowWidget(
                  title: context.detailL10n.countryOrigin,
                  value: catDetail.origin
                ),
                RowWidget(
                  title: context.detailL10n.intelligence,
                  value: '${catDetail.intelligence}'
                ),
                RowWidget(
                  title: context.detailL10n.adaptability,
                  value: '${catDetail.adaptability}'
                ),
                RowWidget(
                  title: context.detailL10n.affectionLevel,
                  value: '${catDetail.affectionLevel}'
                ),
                RowWidget(
                  title: context.detailL10n.childFriendly,
                  value: '${catDetail.childFriendly}'
                ),
                RowWidget(
                  title: context.detailL10n.dogFriendly,
                  value: '${catDetail.dogFriendly}'
                ),
                RowWidget(
                  title: context.detailL10n.energyLevel,
                  value: '${catDetail.energyLevel}'
                ),
                RowWidget(
                  title: context.detailL10n.grooming,
                  value: '${catDetail.grooming}'
                ),
                RowWidget(
                  title: context.detailL10n.healthIssues,
                  value: '${catDetail.healthIssues}'
                ),
                RowWidget(
                  title: context.detailL10n.socialNeeds,
                  value: '${catDetail.socialNeeds}'
                ),
                RowWidget(
                  title: context.detailL10n.strangerFriendly,
                  value: '${catDetail.strangerFriendly}'
                )
              ]
            )
          )
        ]
      )
    );
  }
}