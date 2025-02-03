import 'package:flutter/material.dart';
import '../localization/app_localizations.dart';
import '../widgets/language_selector.dart';
import '../widgets/kurdish_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).translate('welcome')),
        actions: const [
          LanguageSelector(),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            KurdishText(
              AppLocalizations.of(context).translate('hello'),
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            KurdishText(
              AppLocalizations.of(context).translate('settings'),
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            KurdishText(
              AppLocalizations.of(context).translate('profile'),
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
} 