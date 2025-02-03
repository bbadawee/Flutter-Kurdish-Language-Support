import 'package:flutter/material.dart';
import 'package:flutter_kurdish_sorani/flutter_kurdish_sorani.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const KurdishText('پاکێجی کوردی سۆرانی'),
        actions: const [
          // Wrap LanguageSelector in a SizedBox to constrain its width
          SizedBox(
            width: 100,
            child: LanguageSelector(),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Text Examples
          const _SectionTitle('نووسین'),
          const KurdishText(
            'نموونەی تێکستی ئاسایی',
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 8),
          const KurdishText(
            'نموونەی تێکستی تێکەڵاو: Hello دنیا 123',
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 16),

          // Text Input Example
          const _SectionTitle('تێکست فیڵد'),
          const KurdishTextField(
            hintText: 'لێرە بنووسە...',
          ),
          const SizedBox(height: 16),

          // Date & Time Examples
          const _SectionTitle('بەروار و کات'),
          KurdishText('بەرواری ئەمڕۆ: ${KurdishFormatter.date(DateTime.now())}'),
          const SizedBox(height: 8),
          KurdishText('کاتی ئێستا: ${KurdishFormatter.time(DateTime.now())}'),
          const SizedBox(height: 8),
          KurdishText('ڕۆژی هەفتە: ${KurdishFormatter.weekday(DateTime.now())}'),
          const SizedBox(height: 16),
          const KurdishDatePicker(),
          const SizedBox(height: 16),

          // Number Examples
          const _SectionTitle('ژمارە و فۆرمات'),
          KurdishText('ژمارەی کوردی: ${KurdishFormatter.numbers("12345")}'),
          const SizedBox(height: 8),
          KurdishText(
            'دراو: ${KurdishFormatter.currency(1234567.89, currency: "IQD")}',
          ),
          const SizedBox(height: 8),
          KurdishText('ڕێژە: ${KurdishFormatter.percentage(75.5)}'),
          const SizedBox(height: 8),
          KurdishText(
            'ژمارەی تەلەفۆن: ${KurdishFormatter.phoneNumber("07501234567")}',
          ),
          const SizedBox(height: 16),
          const KurdishNumberPicker(),
          const SizedBox(height: 16),

          // RTL Text Examples
          const _SectionTitle('تێکستی تێکەڵاو'),
          const KurdishText(
            'کوردی with English and ١٢٣٤٥ numbers',
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 8),
          const KurdishTextField(
            hintText: 'تێکستی تێکەڵاو بنووسە...',
          ),

          // Show Time Picker
          ElevatedButton(
            onPressed: () async {
              final time = await KurdishTimePicker.show(
                context,
                initialTime: TimeOfDay.now(),
                showKurdishNumbers: true,
                use24HourFormat: false,
              );
              if (time != null) {
                print('Selected time: ${time.format(context)}');
              }
            },
            child: const Text('هەڵبژاردنی کات'),
          ),

          // Show Date Picker
          ElevatedButton(
            onPressed: () async {
              final date = await KurdishCalendar.show(
                context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime(2100),
              );
              if (date != null) {
                print('Selected date: ${date.toString()}');
              }
            },
            child: const Text('هەڵبژاردنی بەروار'),
          ),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;

  const _SectionTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          KurdishText(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }
} 