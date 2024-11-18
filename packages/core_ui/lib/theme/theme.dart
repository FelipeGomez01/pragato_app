import 'package:core_ui/resources/app_colors.dart';
import 'package:core_ui/resources/text_styles.dart';
import 'package:flutter/material.dart';

final theme = ThemeData(
  fontFamily: 'Roboto',
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.primary,
    foregroundColor: AppColors.white,
    titleTextStyle: CustomTextStyles.title.copyWith(
      fontSize: 24
    ),
    centerTitle: true
  )
);