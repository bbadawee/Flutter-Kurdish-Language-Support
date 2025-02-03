# فلەتەر کوردی سۆرانی

![GitHub stars](https://img.shields.io/github/stars/bzhar93/flutter_kurdish_sorani?style=social)
![GitHub forks](https://img.shields.io/github/forks/bzhar93/flutter_kurdish_sorani?style=social)
![GitHub issues](https://img.shields.io/github/issues/bzhar93/flutter_kurdish_sorani)
![GitHub license](https://img.shields.io/github/license/bzhar93/flutter_kurdish_sorani)

پاکێجێکی تەواو بۆ پشتگیری زمانی کوردی سۆرانی (CKB) لە فلەتەر، کە پشتگیری ڕاست بۆ چەپ و وەرگێڕان و باشترکردنی دەرکەوتنی دەق دەکات.

[English](README.md) | [کوردی](README_CKB.md)

## 📱 پیشاندان

<img src="screenshots/demo.gif" width="300">

## ✨ تایبەتمەندییەکان

- 🌐 پشتگیری تەواوی زمانی کوردی سۆرانی
- ⚡️ باشترکردنی دەرکەوتنی دەق بە کوردی
- 📱 پشتگیری ڕاست بۆ چەپ (RTL)
- 🎨 فۆنتی کوردی (ڕێبەر)
- 🔄 گۆڕینی زمان بە ئاسانی
- 📝 نووسینی دەق بە کوردی
- 🎯 پشتگیری دیزاینی ماتریاڵ

## دامەزراندن

ئەم کۆدە زیاد بکە بۆ فایلی `pubspec.yaml`:

```yaml
dependencies:
  flutter_kurdish_sorani:
    git:
      url: https://github.com/bzhar93/flutter_kurdish_sorani.git
      ref: main  # یان تاگێک دیاری بکە
```

پاشان ئەم فەرمانە جێبەجێ بکە:
```bash
flutter pub get
```

## بەکارهێنان

### ١. پێچانەوەی ئەپەکەت

ئەپەکەت بپێچەوە بە `MultiLanguageApp`:

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

### ٢. بەکارهێنانی ویجێتی دەقی کوردی

```dart
import 'package:flutter_kurdish_sorani/flutter_kurdish_sorani.dart';

// لە ویجێتەکەت
KurdishText(
  'سڵاو دنیا',
  style: TextStyle(fontSize: 24),
)
```

### ٣. هەڵبژاردنی زمان

ویجێتی هەڵبژاردنی زمان زیاد بکە:

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

### ٤. نووسینی دەق

`KurdishTextField` بەکاربهێنە بۆ نووسینی دەقی کوردی:

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

## ڕێکخستنی زیاتر

### فۆنت

پاکێجەکە فۆنتی ڕێبەری تێدایە. دڵنیابە کە فایلەکانی فۆنت لە ئەسێتەکانت هەن:

```yaml
flutter:
  fonts:
    - family: Rabar
      fonts:
        - asset: assets/fonts/Rabar-001.ttf
          weight: 400
        - asset: assets/fonts/Rabar-002.ttf
          weight: 700
```

### فایلەکانی وەرگێڕان

فایلەکانی وەرگێڕان زیاد بکە بۆ ئەسێتەکانت:

```yaml
flutter:
  assets:
    - assets/translations/
    - assets/translations/app_en.arb
    - assets/translations/app_ckb.arb
```

## نموونە

سەیری فۆڵدەری [example](example) بکە بۆ نموونەیەکی تەواو.

## بەشداریکردن

بەشداریت بەخێربێت! تکایە Pull Request پێشکەش بکە. بۆ گۆڕانکاری گەورە، تکایە سەرەتا کێشەیەک (issue) دروست بکە بۆ گفتوگۆکردن.

## مۆڵەت

ئەم پڕۆژەیە لەژێر مۆڵەتی MIT دایە - سەیری فایلی [LICENSE](LICENSE) بکە بۆ وردەکاری.

## پشتگیری

بۆ کێشە، داواکاری تایبەتمەندی نوێ، یان پرسیار، تکایە [کێشەیەک دروست بکە](https://github.com/bzhar93/flutter_kurdish_sorani/issues).

## سوپاس و پێزانین

- فۆنت: فۆنتی ڕێبەر لەلایەن [Rabar Erkan](https://www.behance.net/itsrabar)