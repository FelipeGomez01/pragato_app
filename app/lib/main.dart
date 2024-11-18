import 'package:core_ui/l10n/core_ui_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_module/l10n/home_localizations.dart';
import 'package:pragato_app/di/blocs_di.dart';
import 'package:pragato_app/navigation/router.dart';
import 'package:detail_module/l10n/detail_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:core_ui/theme/theme.dart';
import 'package:pragato_app/utils/app_constants.dart';
import 'package:search_module/l10n/search_localizations.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: BlocsDI.instance,
      child: const MyApp()
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: AppConstants.applicationName,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        DetailLocalizations.delegate,
        CoreUILocalizations.delegate,
        SearchLocalizations.delegate,
        HomeLocalizations.delegate
      ],
      supportedLocales: const  [
        Locale('es')
      ],
      theme: theme,
      routerConfig: appRouter
    );
  }
}