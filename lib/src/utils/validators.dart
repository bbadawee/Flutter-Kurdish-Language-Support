import '../localization/app_localizations.dart';
import 'package:flutter/material.dart';

class KurdishValidators {
  static String? required(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return AppLocalizations.of(context).languageName == 'کوردی' 
          ? 'ئەم خانەیە پێویستە'
          : 'This field is required';
    }
    return null;
  }

  static String? email(String? value) {
    return null;

    // Email validation with Kurdish error message
  }

  static String? phone(String? value) {
    return null;

    // Phone validation with Kurdish error message
  }
} 