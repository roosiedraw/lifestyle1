import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lifestyle/utils/constants.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'screens/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        onGenerateTitle: (context) {
          return AppLocalizations.of(context)!.intro1Title;
        },
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          // 'en' is the language code. We could optionally provide a
          // country code as the second param, e.g.
          // Locale('en', 'US'). If we do that, we may want to
          // provide an additional app_en_US.arb file for
          // region-specific translations.
          const Locale('en', ''),
          const Locale('tr', ''),
        ],
        theme: ThemeData(
          textTheme: GoogleFonts.latoTextTheme(
            Theme.of(context).textTheme,
          ),
          colorScheme: ColorScheme.fromSeed(seedColor: mainThemeColor),
          useMaterial3: true,
        ),
        home: const splash());
  }
}
