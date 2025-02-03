import 'package:flutter/material.dart';
import 'package:flutter_kurdish_sorani/flutter_kurdish_sorani.dart';

class DateTimeScreen extends StatelessWidget {
  const DateTimeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();

    return Scaffold(
      appBar: AppBar(
        title: const KurdishText('بەروار و کات'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          KurdishText('بەرواری ئەمڕۆ: ${KurdishFormatter.date(now)}'),
          const SizedBox(height: 16),
          KurdishText('کاتی ئێستا: ${KurdishFormatter.time(now)}'),
          const SizedBox(height: 16),
          KurdishText('ڕۆژی هەفتە: ${KurdishFormatter.weekday(now)}'),
          const SizedBox(height: 32),
          const KurdishDatePicker(),
        ],
      ),
    );
  }
} 