import 'package:flutter/material.dart';
import 'kurdish_calendar.dart';

class KurdishDatePicker extends StatelessWidget {
  final DateTime? initialDate;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final ValueChanged<DateTime>? onDateSelected;
  final String? helpText;

  const KurdishDatePicker({
    super.key,
    this.initialDate,
    this.firstDate,
    this.lastDate,
    this.onDateSelected,
    this.helpText,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: KurdishCalendar(
        initialDate: initialDate,
        firstDate: firstDate,
        lastDate: lastDate,
        onDateSelected: onDateSelected,
      ),
    );
  }

  static Future<DateTime?> show(
    BuildContext context, {
    DateTime? initialDate,
    DateTime? firstDate,
    DateTime? lastDate,
    String? helpText,
  }) async {
    return showDialog<DateTime>(
      context: context,
      builder: (context) => Dialog(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (helpText != null) 
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Text(helpText),
                ),
              KurdishCalendar(
                initialDate: initialDate,
                firstDate: firstDate,
                lastDate: lastDate,
                onDateSelected: (date) => Navigator.of(context).pop(date),
              ),
            ],
          ),
        ),
      ),
    );
  }
} 