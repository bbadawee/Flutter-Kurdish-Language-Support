import 'package:flutter/material.dart';
import 'package:flutter_kurdish_sorani/flutter_kurdish_sorani.dart';

class NumberFormatScreen extends StatelessWidget {
  const NumberFormatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const KurdishText('ژمارە و فۆرمات'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          KurdishText('ژمارەی کوردی: ${KurdishFormatter.numbers("12345")}'),
          const SizedBox(height: 16),
          KurdishText(
            'دراو: ${KurdishFormatter.currency(1234567.89, currency: "IQD")}',
          ),
          const SizedBox(height: 16),
          KurdishText('ڕێژە: ${KurdishFormatter.percentage(75.5)}'),
          const SizedBox(height: 16),
          KurdishText(
            'ژمارەی تەلەفۆن: ${KurdishFormatter.phoneNumber("07501234567")}',
          ),
          const SizedBox(height: 32),
          const KurdishNumberPicker(),
        ],
      ),
    );
  }
} 