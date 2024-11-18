import 'package:flutter/material.dart';

import 'core_ui_localizations.dart';

extension CoreUILocalizationsExt on BuildContext {
  CoreUILocalizations get coreUiL10n {
    final l10n = CoreUILocalizations.of(this);
    if (l10n != null) return l10n;
    throw Exception(
      'Did you forget to add this localization delegate to material app?',
    );
  }
}
