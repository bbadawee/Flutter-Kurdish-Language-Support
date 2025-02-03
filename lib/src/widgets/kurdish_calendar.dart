import 'package:flutter/material.dart';
import '../utils/text_direction_utils.dart';

class KurdishCalendar extends StatefulWidget {
  final DateTime? initialDate;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final ValueChanged<DateTime>? onDateSelected;
  final bool showKurdishNumbers;

  const KurdishCalendar({
    super.key,
    this.initialDate,
    this.firstDate,
    this.lastDate,
    this.onDateSelected,
    this.showKurdishNumbers = true,
  });

  @override
  State<KurdishCalendar> createState() => _KurdishCalendarState();

  /// Shows a dialog containing the Kurdish calendar picker.
  static Future<DateTime?> show(
    BuildContext context, {
    DateTime? initialDate,
    DateTime? firstDate,
    DateTime? lastDate,
    bool showKurdishNumbers = true,
  }) async {
    return showDialog<DateTime>(
      context: context,
      builder: (context) => Dialog(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              KurdishCalendar(
                initialDate: initialDate,
                firstDate: firstDate,
                lastDate: lastDate,
                showKurdishNumbers: showKurdishNumbers,
                onDateSelected: (date) => Navigator.of(context).pop(date),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _KurdishCalendarState extends State<KurdishCalendar> {
  late DateTime _currentMonth;
  late DateTime _selectedDate;

  // Add list of Kurdish months
  final List<String> _kurdishMonths = [
    'کانوونی دووەم',
    'شوبات',
    'ئازار',
    'نیسان',
    'ئایار',
    'حوزەیران',
    'تەممووز',
    'ئاب',
    'ئەیلوول',
    'تشرینی یەکەم',
    'تشرینی دووەم',
    'کانوونی یەکەم',
  ];

  // Add year selection range
  List<int> _getYearRange() {
    final currentYear = DateTime.now().year;
    return List.generate(100, (index) => currentYear - 50 + index);
  }

  @override
  void initState() {
    super.initState();
    _currentMonth = widget.initialDate ?? DateTime.now();
    _selectedDate = widget.initialDate ?? DateTime.now();
  }

  void _onMonthChanged(bool next) {
    setState(() {
      _currentMonth = DateTime(
        _currentMonth.year,
        _currentMonth.month + (next ? 1 : -1),
      );
    });
  }

  void _showMonthYearPicker() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Year Picker
                Row(
                  children: [
                    const Text('ساڵ: '),
                    const SizedBox(width: 8),
                    DropdownButton<int>(
                      value: _currentMonth.year,
                      items: _getYearRange()
                          .map((year) => DropdownMenuItem<int>(
                                value: year,
                                child: Text(
                                  widget.showKurdishNumbers
                                      ? TextDirectionUtils.convertToKurdishNumbers(year.toString())
                                      : year.toString(),
                                ),
                              ))
                          .toList(),
                      onChanged: (int? year) {
                        if (year != null) {
                          setState(() {
                            _currentMonth = DateTime(year, _currentMonth.month);
                          });
                          Navigator.pop(context);
                        }
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                // Month Grid
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 2.5,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                  itemCount: 12,
                  itemBuilder: (context, index) {
                    final isSelected = index + 1 == _currentMonth.month;
                    return InkWell(
                      onTap: () {
                        setState(() {
                          _currentMonth = DateTime(_currentMonth.year, index + 1);
                        });
                        Navigator.pop(context);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: isSelected ? Theme.of(context).primaryColor : null,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: isSelected 
                                ? Theme.of(context).primaryColor 
                                : Theme.of(context).dividerColor,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            _kurdishMonths[index],
                            style: TextStyle(
                              color: isSelected ? Colors.white : null,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Month and Year Header
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(Icons.chevron_right),
              onPressed: () => _onMonthChanged(false),
              tooltip: 'مانگی پێشوو',
            ),
            // Make the month/year text clickable
            InkWell(
              onTap: _showMonthYearPicker,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      _formatMonthYear(_currentMonth),
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const Icon(Icons.arrow_drop_down),
                  ],
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.chevron_left),
              onPressed: () => _onMonthChanged(true),
              tooltip: 'مانگی داهاتوو',
            ),
          ],
        ),
        const SizedBox(height: 8),
        // Weekday Headers
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: _buildWeekdayHeaders(),
        ),
        const SizedBox(height: 8),
        // Calendar Grid
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7,
            childAspectRatio: 1,
          ),
          itemCount: _getDaysInMonth(_currentMonth),
          itemBuilder: (context, index) {
            final date = DateTime(_currentMonth.year, _currentMonth.month, index + 1);
            final isSelected = _isSameDay(date, _selectedDate);
            final isToday = _isSameDay(date, DateTime.now());

            return InkWell(
              onTap: () {
                setState(() => _selectedDate = date);
                widget.onDateSelected?.call(date);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: isSelected ? Theme.of(context).primaryColor : null,
                  border: isToday ? Border.all(color: Theme.of(context).primaryColor) : null,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    widget.showKurdishNumbers 
                      ? TextDirectionUtils.convertToKurdishNumbers('${index + 1}')
                      : '${index + 1}',
                    style: TextStyle(
                      color: isSelected ? Colors.white : null,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  List<Widget> _buildWeekdayHeaders() {
    const weekdays = ['ش', 'ی', 'د', 'س', 'چ', 'پ', 'ه'];
    return weekdays.map((day) => Text(day)).toList();
  }

  String _formatMonthYear(DateTime date) {
    final month = TextDirectionUtils.monthMap[
      DateTime(date.year, date.month).toString().split(' ')[1]
    ] ?? '';
    final year = widget.showKurdishNumbers 
      ? TextDirectionUtils.convertToKurdishNumbers(date.year.toString())
      : date.year.toString();
    return '$month $year';
  }

  int _getDaysInMonth(DateTime date) {
    return DateTime(date.year, date.month + 1, 0).day;
  }

  bool _isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }
} 