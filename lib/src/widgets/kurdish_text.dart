import 'package:flutter/material.dart';
import '../utils/text_direction_utils.dart';

class KurdishText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final bool detectDirection;
  final bool convertNumbers;
  final int? maxLines;
  final TextOverflow? overflow;

  const KurdishText(
    this.text, {
    super.key,
    this.style,
    this.textAlign,
    this.detectDirection = true,
    this.convertNumbers = true,
    this.maxLines,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    final processedText = convertNumbers 
        ? TextDirectionUtils.convertToKurdishNumbers(text)
        : text;

    return Text(
      processedText,
      style: style?.copyWith(
        fontFamily: style?.fontFamily ?? 'Rabar',
        height: style?.height ?? 1.5,
      ),
      textAlign: textAlign ?? TextAlign.right,
      textDirection: detectDirection 
          ? TextDirectionUtils.getMixedTextDirection(text, 'ckb')
          : TextDirection.rtl,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
} 