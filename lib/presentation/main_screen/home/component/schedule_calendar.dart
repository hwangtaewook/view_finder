import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class ScheduleCalendar extends StatefulWidget {
  const ScheduleCalendar({super.key}); // 수정

  @override
  State<ScheduleCalendar> createState() => _ScheduleCalendarState();
}

class _ScheduleCalendarState extends State<ScheduleCalendar> {
  late CalendarManager _calendarManager;
  late List<Event> _selectedEvents;

  @override
  void initState() {
    super.initState();
    _calendarManager = CalendarManager();
    _selectedEvents = [];
  }

  void _onRangeSelected(DateTime? start, DateTime? end, DateTime? focused) {
    setState(() {
      _selectedEvents = _calendarManager.getEventsInRange(start!, end!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('캘린더'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TableCalendar(
            onRangeSelected: _onRangeSelected,
            focusedDay: DateTime.now(),
            firstDay: DateTime.utc(2020, 1, 1),
            lastDay: DateTime.utc(2030, 12, 31),
          ),
          SizedBox(height: 20),
          Text(
            '선택된 일정:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _selectedEvents.length,
              itemBuilder: (context, index) {
                final event = _selectedEvents[index];
                return ListTile(
                  title: Text(event.title),
                  subtitle: Text(
                      '${event.startDate} - ${event.endDate}'), // 일정 기간을 표시합니다.
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Event {
  final String title;
  final DateTime startDate;
  final DateTime endDate;

  Event({
    required this.title,
    required this.startDate,
    required this.endDate,
  }); // 수정
}

class CalendarManager {
  List<Event> events = [
    Event(
      title: '일정 1',
      startDate: DateTime(2024, 6, 12),
      endDate: DateTime(2024, 6, 14),
    ),
    Event(
      title: '일정 2',
      startDate: DateTime(2024, 6, 15),
      endDate: DateTime(2024, 6, 18),
    ),
    // 추가적인 일정을 필요에 따라 추가할 수 있습니다.
  ];

  List<Event> getEventsInRange(DateTime start, DateTime end) {
    return events.where((event) {
      return event.startDate.isBefore(end) && event.endDate.isAfter(start);
    }).toList();
  }
}
