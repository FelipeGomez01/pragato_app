import 'package:flutter/material.dart';

import 'detail_localizations.dart';

extension DetailLocalizationsExt on BuildContext {
  DetailLocalizations get detailL10n {
    final l10n = DetailLocalizations.of(this);
    if (l10n != null) return l10n;
    throw Exception(
      'Did you forget to add this localization delegate to material app?',
    );
  }
}
