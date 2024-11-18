import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'detail_localizations_es.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of DetailLocalizations
/// returned by `DetailLocalizations.of(context)`.
///
/// Applications need to include `DetailLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/detail_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: DetailLocalizations.localizationsDelegates,
///   supportedLocales: DetailLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the DetailLocalizations.supportedLocales
/// property.
abstract class DetailLocalizations {
  DetailLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static DetailLocalizations? of(BuildContext context) {
    return Localizations.of<DetailLocalizations>(context, DetailLocalizations);
  }

  static const LocalizationsDelegate<DetailLocalizations> delegate = _DetailLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('es')
  ];

  /// No description provided for @countryOrigin.
  ///
  /// In es, this message translates to:
  /// **'Pais de Origen'**
  String get countryOrigin;

  /// No description provided for @intelligence.
  ///
  /// In es, this message translates to:
  /// **'Inteligencia'**
  String get intelligence;

  /// No description provided for @adaptability.
  ///
  /// In es, this message translates to:
  /// **'Adaptabilidad'**
  String get adaptability;

  /// No description provided for @affectionLevel.
  ///
  /// In es, this message translates to:
  /// **'Nivel Afectivo'**
  String get affectionLevel;

  /// No description provided for @childFriendly.
  ///
  /// In es, this message translates to:
  /// **'Apto para niños'**
  String get childFriendly;

  /// No description provided for @dogFriendly.
  ///
  /// In es, this message translates to:
  /// **'Apto para perros'**
  String get dogFriendly;

  /// No description provided for @energyLevel.
  ///
  /// In es, this message translates to:
  /// **'Nivel de energía'**
  String get energyLevel;

  /// No description provided for @grooming.
  ///
  /// In es, this message translates to:
  /// **'Arreglo'**
  String get grooming;

  /// No description provided for @healthIssues.
  ///
  /// In es, this message translates to:
  /// **'Problemas de salud'**
  String get healthIssues;

  /// No description provided for @socialNeeds.
  ///
  /// In es, this message translates to:
  /// **'Necesidades sociales'**
  String get socialNeeds;

  /// No description provided for @strangerFriendly.
  ///
  /// In es, this message translates to:
  /// **'Extraño amigable'**
  String get strangerFriendly;
}

class _DetailLocalizationsDelegate extends LocalizationsDelegate<DetailLocalizations> {
  const _DetailLocalizationsDelegate();

  @override
  Future<DetailLocalizations> load(Locale locale) {
    return SynchronousFuture<DetailLocalizations>(lookupDetailLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['es'].contains(locale.languageCode);

  @override
  bool shouldReload(_DetailLocalizationsDelegate old) => false;
}

DetailLocalizations lookupDetailLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'es': return DetailLocalizationsEs();
  }

  throw FlutterError(
    'DetailLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
