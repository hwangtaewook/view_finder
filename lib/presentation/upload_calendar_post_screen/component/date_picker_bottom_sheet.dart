import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DatePickerBottomSheet extends StatefulWidget {
  final Function(DateTime)? onDateSelected;
  final DateTime? initialDate;

  const DatePickerBottomSheet({
    super.key,
    this.onDateSelected,
    this.initialDate,
  });

  @override
  State<DatePickerBottomSheet> createState() => _DatePickerBottomSheetState();
}

class _DatePickerBottomSheetState extends State<DatePickerBottomSheet> {
  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.initialDate ?? DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: CupertinoDatePicker(
        minimumYear: 2018,
        maximumYear: 2030,
        mode: CupertinoDatePickerMode.date,
        initialDateTime: _selectedDate,
        onDateTimeChanged: (DateTime newDateTime) {
          setState(() {
            _selectedDate = newDateTime;
          });
          widget.onDateSelected?.call(newDateTime);
        },
      ),
    );
  }
}
