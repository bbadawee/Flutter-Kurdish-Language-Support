import 'package:flutter/material.dart';
import '../utils/text_direction_utils.dart';

class KurdishTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onChanged;
  final TextInputType? keyboardType;
  final bool enforceRTL;
  final InputDecoration? decoration;
  final int? maxLines;
  final int? minLines;
  final bool expands;
  final bool? enabled;
  final FocusNode? focusNode;

  const KurdishTextField({
    super.key,
    this.controller,
    this.hintText,
    this.textInputAction,
    this.onChanged,
    this.keyboardType,
    this.enforceRTL = true,
    this.decoration,
    this.maxLines = 1,
    this.minLines,
    this.expands = false,
    this.enabled,
    this.focusNode,
  });

  @override
  State<KurdishTextField> createState() => _KurdishTextFieldState();
}

class _KurdishTextFieldState extends State<KurdishTextField> {
  late TextEditingController _controller;
  TextDirection _textDirection = TextDirection.rtl;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _updateTextDirection(_controller.text);
    _controller.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  void _onTextChanged() {
    _updateTextDirection(_controller.text);
  }

  void _updateTextDirection(String text) {
    if (!widget.enforceRTL) return;

    final newDirection = TextDirectionUtils.getMixedTextDirection(text, 'ckb');
    if (newDirection != _textDirection) {
      setState(() {
        _textDirection = newDirection;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: _textDirection,
      child: TextField(
        controller: _controller,
        focusNode: widget.focusNode,
        textDirection: _textDirection,
        textAlign: TextAlign.right,
        textAlignVertical: TextDirectionUtils.getTextAlignVertical('ckb'),
        decoration: widget.decoration?.copyWith(
          hintText: widget.hintText,
          hintTextDirection: TextDirection.rtl,
          contentPadding: widget.decoration?.contentPadding ??
              const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          border: widget.decoration?.border ?? const OutlineInputBorder(),
          alignLabelWithHint: true,
        ) ?? InputDecoration(
          hintText: widget.hintText,
          hintTextDirection: TextDirection.rtl,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          border: const OutlineInputBorder(),
          alignLabelWithHint: true,
        ),
        textInputAction: widget.textInputAction,
        onChanged: (value) {
          widget.onChanged?.call(value);
          _updateTextDirection(value);
        },
        keyboardType: widget.keyboardType,
        style: const TextStyle(
          fontFamily: 'Rabar',
          fontSize: 16,
          height: 1.5,
        ),
        maxLines: widget.maxLines,
        minLines: widget.minLines,
        expands: widget.expands,
        enabled: widget.enabled,
      ),
    );
  }
} 