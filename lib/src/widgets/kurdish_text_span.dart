import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import '../utils/text_direction_utils.dart';

class KurdishTextSpan extends TextSpan {
  KurdishTextSpan({
    String? text,
    TextStyle? style,
    List<InlineSpan>? children,
    GestureRecognizer? recognizer,
    bool convertNumbers = true,
  }) : super(
    text: text != null && convertNumbers 
        ? TextDirectionUtils.convertToKurdishNumbers(text)
        : text,
    style: style?.copyWith(
      fontFamily: style.fontFamily ?? 'Rabar',
      height: style.height ?? 1.5,
    ),
    children: children,
    recognizer: recognizer,
  );
} 