import 'package:flutter/material.dart';
import '../utils/text_direction_utils.dart';

class KurdishTimePicker extends StatefulWidget {
  final TimeOfDay? initialTime;
  final ValueChanged<TimeOfDay>? onTimeSelected;
  final bool showKurdishNumbers;
  final bool use24HourFormat;

  const KurdishTimePicker({
    super.key,
    this.initialTime,
    this.onTimeSelected,
    this.showKurdishNumbers = true,
    this.use24HourFormat = false,
  });

  @override
  State<KurdishTimePicker> createState() => _KurdishTimePickerState();

  static Future<TimeOfDay?> show(
    BuildContext context, {
    TimeOfDay? initialTime,
    bool showKurdishNumbers = true,
    bool use24HourFormat = false,
  }) async {
    return showDialog<TimeOfDay>(
      context: context,
      builder: (context) => Dialog(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              KurdishTimePicker(
                initialTime: initialTime,
                showKurdishNumbers: showKurdishNumbers,
                use24HourFormat: use24HourFormat,
                onTimeSelected: (time) => Navigator.of(context).pop(time),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _KurdishTimePickerState extends State<KurdishTimePicker> {
  late int _hour;
  late int _minute;
  late bool _isAM;

  @override
  void initState() {
    super.initState();
    final initialTime = widget.initialTime ?? TimeOfDay.now();
    _hour = initialTime.hour;
    _minute = initialTime.minute;
    _isAM = _hour < 12;
    if (!widget.use24HourFormat) {
      _hour = _hour % 12;
      if (_hour == 0) _hour = 12;
    }
  }

  void _updateTime() {
    final selectedHour = widget.use24HourFormat
        ? _hour
        : (_isAM ? _hour : (_hour == 12 ? 12 : _hour + 12));
    
    final time = TimeOfDay(hour: selectedHour, minute: _minute);
    widget.onTimeSelected?.call(time);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _TimeWheel(
              value: _hour,
              maxValue: widget.use24HourFormat ? 23 : 12,
              minValue: widget.use24HourFormat ? 0 : 1,
              onChanged: (value) {
                setState(() {
                  _hour = value;
                  _updateTime();
                });
              },
              showKurdishNumbers: widget.showKurdishNumbers,
            ),
            const Text(' : '),
            _TimeWheel(
              value: _minute,
              maxValue: 59,
              minValue: 0,
              onChanged: (value) {
                setState(() {
                  _minute = value;
                  _updateTime();
                });
              },
              showKurdishNumbers: widget.showKurdishNumbers,
            ),
            if (!widget.use24HourFormat) ...[
              const SizedBox(width: 16),
              Column(
                children: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _isAM = true;
                        _updateTime();
                      });
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: _isAM ? Theme.of(context).primaryColor : null,
                    ),
                    child: Text(
                      'پ.ن',
                      style: TextStyle(
                        color: _isAM ? Colors.white : null,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _isAM = false;
                        _updateTime();
                      });
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: !_isAM ? Theme.of(context).primaryColor : null,
                    ),
                    child: Text(
                      'د.ن',
                      style: TextStyle(
                        color: !_isAM ? Colors.white : null,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ],
    );
  }
}

class _TimeWheel extends StatelessWidget {
  final int value;
  final int maxValue;
  final int minValue;
  final ValueChanged<int> onChanged;
  final bool showKurdishNumbers;

  const _TimeWheel({
    required this.value,
    required this.maxValue,
    required this.minValue,
    required this.onChanged,
    required this.showKurdishNumbers,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: 60,
      child: ListWheelScrollView.useDelegate(
        itemExtent: 40,
        perspective: 0.005,
        diameterRatio: 1.2,
        physics: const FixedExtentScrollPhysics(),
        controller: FixedExtentScrollController(
          initialItem: value - minValue,
        ),
        onSelectedItemChanged: (index) {
          onChanged(index + minValue);
        },
        childDelegate: ListWheelChildBuilderDelegate(
          childCount: maxValue - minValue + 1,
          builder: (context, index) {
            final number = (index + minValue).toString().padLeft(2, '0');
            return Center(
              child: Text(
                showKurdishNumbers
                    ? TextDirectionUtils.convertToKurdishNumbers(number)
                    : number,
                style: TextStyle(
                  fontSize: 20,
                  color: (index + minValue) == value
                      ? Theme.of(context).primaryColor
                      : null,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
} 