import 'package:flutter/material.dart';
import 'kurdish_sorani_app.dart';

class LanguageToggleButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const LanguageToggleButton({
    super.key,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final currentLocale = Localizations.localeOf(context).languageCode;
    final isKurdish = currentLocale == 'ckb';

    return TextButton.icon(
      onPressed: () {
        final appState = KurdishSoraniApp.of(context);
        if (appState != null) {
          appState.changeLanguage(isKurdish ? 'en' : 'ckb');
        }
        onPressed?.call();
      },
      icon: const Icon(Icons.language),
      label: Text(
        isKurdish ? 'English' : 'کوردی',
        style: TextStyle(
          fontFamily: isKurdish ? null : 'Rabar',
        ),
      ),
    );
  }
} 