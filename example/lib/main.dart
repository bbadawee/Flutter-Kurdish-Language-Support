import 'package:flutter/material.dart';
import 'package:flutter_kurdish_sorani/flutter_kurdish_sorani.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const ExampleApp());
}

class ExampleApp extends StatelessWidget {
  const ExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiLanguageApp(
      initialLocale: 'ckb',
      supportedLocales: const [
        Locale('en'),
        Locale('ckb'),
      ],
      useRabarFont: true,
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Navigator(
          onGenerateRoute: (settings) {
            return MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            );
          },
        ),
      ),
    );
  }
} 