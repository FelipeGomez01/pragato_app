import 'package:flutter/material.dart';
import 'package:search_module/l10n/search_localizations.dart';

extension SearchLocalizationsExt on BuildContext {
  SearchLocalizations get searchL10n {
    final l10n = SearchLocalizations.of(this);
    if (l10n != null) return l10n;
    throw Exception(
      'Did you forget to add this localization delegate to material app?',
    );
  }
}