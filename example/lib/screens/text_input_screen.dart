import 'package:flutter/material.dart';
import 'package:flutter_kurdish_sorani/flutter_kurdish_sorani.dart';

class TextInputScreen extends StatelessWidget {
  const TextInputScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const KurdishText('نووسین و تێکست'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          KurdishText(
            'نموونەی تێکستی ئاسایی',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 16),
          KurdishTextField(
            hintText: 'لێرە بنووسە...',
          ),
          SizedBox(height: 16),
          KurdishText(
            'نموونەی تێکستی تێکەڵاو: Hello دنیا 123',
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
} 