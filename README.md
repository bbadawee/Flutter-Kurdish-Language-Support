# Flutter Kurdish Sorani

A comprehensive Flutter package for Kurdish Sorani (CKB) language support with RTL compatibility, localization, and improved text rendering.

[![pub package](https://img.shields.io/pub/v/flutter_kurdish_sorani.svg)](https://pub.dev/packages/flutter_kurdish_sorani)
[![likes](https://img.shields.io/pub/likes/flutter_kurdish_sorani)](https://pub.dev/packages/flutter_kurdish_sorani/score)
[![popularity](https://img.shields.io/pub/popularity/flutter_kurdish_sorani)](https://pub.dev/packages/flutter_kurdish_sorani/score)

## Features

- 🌐 Full Kurdish Sorani (CKB) localization support
- ⚡️ Optimized text rendering for Kurdish characters
- 📱 RTL (Right-to-Left) layout support
- 🎨 Custom Kurdish font integration (Rabar)
- 🔄 Easy language switching
- 📝 Kurdish text input handling
- 🎯 Material Design localization

## Installation

Add this to your package's `pubspec.yaml` file:


yaml
dependencies:
flutter_kurdish_sorani: ^0.1.0


## Usage

### 1. Wrap Your App

Wrap your MaterialApp with `MultiLanguageApp`:

```dart
void main() {
  runApp(
    const MultiLanguageApp(
      child: MaterialApp(
        home: MyHomePage(),
      ),
    ),
  );
}
```

### 2. Use Kurdish Text Widget

```dart
import 'package:flutter_kurdish_sorani/flutter_kurdish_sorani.dart';

// In your widget
KurdishText(
  'سڵاو دنیا',
  style: TextStyle(fontSize: 24),
)
```

### 3. Language Selector

Add the language selector widget to switch between languages:

```dart
Scaffold(
  appBar: AppBar(
    actions: [
      SizedBox(
        width: 100,
        child: LanguageSelector(),
      ),
    ],
  ),
)
```

### 4. Text Input

Use `KurdishTextField` for proper Kurdish text input handling:

```dart
KurdishTextField(
  decoration: InputDecoration(
    labelText: 'ناو',
    hintText: 'ناوی خۆت بنووسە',
  ),
  onChanged: (value) {
    print(value);
  },
)
```

## Additional Configuration

### Custom Font

The package includes the Rabar font by default. To use it, make sure you have the font files in your assets:

```yaml
flutter:
  fonts:
    - family: Rabar
      fonts:
        - asset: assets/fonts/Rabar-001.ttf
        - asset: assets/fonts/Rabar-002.ttf
          weight: 700
```

### Localization Files

Add translation files to your assets:

```yaml
flutter:
  assets:
    - assets/translations/
    - assets/translations/app_en.arb
    - assets/translations/app_ckb.arb
```

## Example

Check out the [example](example) directory for a complete sample application demonstrating all features.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request. For major changes, please open an issue first to discuss what you would like to change.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Support

If you find this package helpful, please give it a like 👍 on [pub.dev](https://pub.dev/packages/flutter_kurdish_sorani)!

For issues, feature requests, or questions, please [create an issue](https://github.com/YOUR_USERNAME/flutter_kurdish_sorani/issues).

## Credits

- Font: Rabar font by [Rabar Erkan](https://www.behance.net/itsrabar) - Motion Designer & 3D Generalist from Erbil, Iraq
- Contributors: [List of contributors]

