import 'package:flutter/material.dart';
import '../utils/text_direction_utils.dart';

class KurdishNumberPicker extends StatefulWidget {
  final int initialValue;
  final int minValue;
  final int maxValue;
  final ValueChanged<int>? onChanged;
  final bool useKurdishNumbers;

  const KurdishNumberPicker({
    super.key,
    this.initialValue = 0,
    this.minValue = 0,
    this.maxValue = 100,
    this.onChanged,
    this.useKurdishNumbers = true,
  });

  @override
  State<KurdishNumberPicker> createState() => _KurdishNumberPickerState();
}

class _KurdishNumberPickerState extends State<KurdishNumberPicker> {
  late int _currentValue;

  @override
  void initState() {
    super.initState();
    _currentValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: const Icon(Icons.remove),
          onPressed: _currentValue > widget.minValue
              ? () => _updateValue(_currentValue - 1)
              : null,
        ),
        Text(
          widget.useKurdishNumbers
              ? TextDirectionUtils.convertToKurdishNumbers(_currentValue.toString())
              : _currentValue.toString(),
          style: const TextStyle(
            fontFamily: 'Rabar',
            fontSize: 20,
          ),
        ),
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: _currentValue < widget.maxValue
              ? () => _updateValue(_currentValue + 1)
              : null,
        ),
      ],
    );
  }

  void _updateValue(int newValue) {
    setState(() {
      _currentValue = newValue;
      widget.onChanged?.call(newValue);
    });
  }
} 