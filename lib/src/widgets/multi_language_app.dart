import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import '../localization/app_localizations.dart';
import '../localization/kurdish_material_localizations.dart';
import '../localization/kurdish_cupertino_localizations.dart';
import '../utils/text_direction_utils.dart';

class MultiLanguageApp extends StatefulWidget {
  final Widget child;
  final String initialLocale;
  final List<Locale> supportedLocales;
  final bool useRabarFont;

  const MultiLanguageApp({
    super.key,
    required this.child,
    this.initialLocale = 'ckb',
    this.supportedLocales = const [
      Locale('en'),
      Locale('ckb'),
    ],
    this.useRabarFont = true,
  });

  static MultiLanguageAppState? of(BuildContext context) {
    return context.findAncestorStateOfType<MultiLanguageAppState>();
  }

  @override
  State<MultiLanguageApp> createState() => MultiLanguageAppState();
}

class MultiLanguageAppState extends State<MultiLanguageApp> {
  late String _currentLocale;

  String get currentLocale => _currentLocale;

  @override
  void initState() {
    super.initState();
    _currentLocale = widget.initialLocale;
  }

  void changeLanguage(String locale) {
    if (widget.supportedLocales.any((l) => l.languageCode == locale)) {
      setState(() {
        _currentLocale = locale;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: Locale(_currentLocale),
      supportedLocales: widget.supportedLocales,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        KurdishMaterialLocalizations.delegate,
        KurdishCupertinoLocalizations.delegate,
      ],
      builder: (context, child) {
        return Directionality(
          textDirection: TextDirectionUtils.getTextDirection(_currentLocale),
          child: MediaQuery(
            data: MediaQuery.of(context).copyWith(
              textScaler: const TextScaler.linear(1.0),
            ),
            child: widget.child,
          ),
        );
      },
      home: widget.child,
    );
  }
} 