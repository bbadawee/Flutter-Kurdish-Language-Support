import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import '../localization/app_localizations.dart';
import '../utils/text_direction_utils.dart';

/// A widget that provides Kurdish Sorani language support and RTL functionality for Flutter apps.
/// 
/// This widget should be used as a root widget in your application to provide:
/// * Kurdish Sorani language support
/// * RTL text direction
/// * Proper text scaling
/// * Rabar font integration
/// * Localization delegates
/// 
/// Example usage:
/// ```dart
/// void main() {
///   runApp(
///     KurdishSoraniApp(
///       initialLocale: 'ckb',
///       child: MaterialApp(
///         home: MyHomePage(),
///       ),
///     ),
///   );
/// }
/// ```
class KurdishSoraniApp extends StatefulWidget {
  /// The child widget to be wrapped with Kurdish Sorani support
  final Widget child;

  /// The initial locale to use. Defaults to 'ckb' (Kurdish Sorani)
  /// 
  /// Supported values:
  /// * 'ckb' - Kurdish Sorani
  /// * 'en' - English
  final String initialLocale;

  const KurdishSoraniApp({
    super.key,
    required this.child,
    this.initialLocale = 'ckb',
  });

  /// Provides access to the [KurdishSoraniAppState] from descendant widgets.
  /// 
  /// This can be used to change the language at runtime:
  /// ```dart
  /// KurdishSoraniApp.of(context)?.changeLanguage('en');
  /// ```
  static KurdishSoraniAppState? of(BuildContext context) {
    return context.findAncestorStateOfType<KurdishSoraniAppState>();
  }

  @override
  State<KurdishSoraniApp> createState() => KurdishSoraniAppState();
}

class KurdishSoraniAppState extends State<KurdishSoraniApp> {
  late String _currentLocale;

  @override
  void initState() {
    super.initState();
    _currentLocale = widget.initialLocale;
  }

  /// Changes the application's language.
  /// 
  /// [locale] should be either 'ckb' for Kurdish Sorani or 'en' for English.
  void changeLanguage(String locale) {
    setState(() {
      _currentLocale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: Locale(_currentLocale),
      supportedLocales: const [
        Locale('ckb'), // Kurdish Sorani
        Locale('en'), // English
      ],
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      builder: (context, child) {
        // Apply RTL text direction based on locale
        return Directionality(
          textDirection: TextDirectionUtils.getTextDirection(_currentLocale),
          child: Builder(
            builder: (context) {
              // Apply consistent text scaling
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(
                  textScaler: const TextScaler.linear(1.0),
                ),
                child: widget.child,
              );
            },
          ),
        );
      },
      // Apply Rabar font and Kurdish-friendly theme settings
      theme: ThemeData(
        fontFamily: 'Rabar',
        textTheme: const TextTheme(
          bodyLarge: TextStyle(
            fontFamily: 'Rabar',
            height: 1.5,
          ),
          bodyMedium: TextStyle(
            fontFamily: 'Rabar',
            height: 1.5,
          ),
          titleLarge: TextStyle(
            fontFamily: 'Rabar',
            height: 1.5,
          ),
          titleMedium: TextStyle(
            fontFamily: 'Rabar',
            height: 1.5,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          alignLabelWithHint: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
        ),
      ),
    );
  }
} 