import 'package:flutter/material.dart';
import 'package:home_module/l10n/home_localizations.dart';

extension HomeLocalizationsExt on BuildContext {
  HomeLocalizations get homeL10n {
    final l10n = HomeLocalizations.of(this);
    if (l10n != null) return l10n;
    throw Exception(
      'Did you forget to add this localization delegate to material app?',
    );
  }
}