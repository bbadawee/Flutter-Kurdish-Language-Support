import 'package:flutter/material.dart';
import 'multi_language_app.dart';

class LanguageSelector extends StatelessWidget {
  final VoidCallback? onChanged;
  final bool showFlags;
  final Widget? customButton;

  const LanguageSelector({
    super.key,
    this.onChanged,
    this.showFlags = true,
    this.customButton,
  });

  @override
  Widget build(BuildContext context) {
    final currentLocale = Localizations.localeOf(context).languageCode;

    return customButton ?? PopupMenuButton<String>(
      icon: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (showFlags) ...[
            _getFlag(currentLocale),
            const SizedBox(width: 8),
          ],
          Text(
            _getLanguageName(currentLocale),
            style: const TextStyle(fontSize: 14),
          ),
          const Icon(Icons.arrow_drop_down),
        ],
      ),
      onSelected: (String locale) {
        final appState = MultiLanguageApp.of(context);
        if (appState != null) {
          appState.changeLanguage(locale);
          onChanged?.call();
        }
      },
      itemBuilder: (BuildContext context) {
        return [
          _buildMenuItem('en', 'English'),
          _buildMenuItem('ckb', 'کوردی'),
          _buildMenuItem('ar', 'العربية'),
        ];
      },
    );
  }

  PopupMenuItem<String> _buildMenuItem(String locale, String name) {
    return PopupMenuItem<String>(
      value: locale,
      child: Row(
        children: [
          if (showFlags) _getFlag(locale),
          const SizedBox(width: 8),
          Text(
            name,
            style: TextStyle(
              fontFamily: locale == 'ckb' ? 'Rabar' : null,
            ),
          ),
        ],
      ),
    );
  }

  Widget _getFlag(String locale) {
    // You can replace these with actual flag images
    final flag = switch (locale) {
      'en' => '🇺🇸',
      'ckb' => '🇮🇶',
      'ar' => '🇸🇦',
      _ => '🏳️',
    };

    return Text(flag, style: const TextStyle(fontSize: 24));
  }

  String _getLanguageName(String locale) {
    return switch (locale) {
      'en' => 'English',
      'ckb' => 'کوردی',
      'ar' => 'العربية',
      _ => locale,
    };
  }
} 