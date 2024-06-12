import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class ScheduleCalendar extends StatefulWidget {
  const ScheduleCalendar({super.key});

  @override
  State<ScheduleCalendar> createState() => _ScheduleCalendarState();
}

class _ScheduleCalendarState extends State<ScheduleCalendar> {
  List<Meeting> meetings = <Meeting>[];

  @override
  void initState() {
    super.initState();
    meetings = _getDataSource();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SfCalendar(
            view: CalendarView.month,
            headerDateFormat: 'yy년 M월',
            headerStyle: const CalendarHeaderStyle(
                textAlign: TextAlign.center, backgroundColor: Colors.white),
            dataSource: MeetingDataSource(meetings),
            monthViewSettings: const MonthViewSettings(
                appointmentDisplayMode:
                    MonthAppointmentDisplayMode.appointment),
          ),
        ),
        FloatingActionButton(
          onPressed: _showAddMeetingDialog,
          child: const Icon(Icons.add),
        ),
      ],
    );
  }

  void _showAddMeetingDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final TextEditingController eventNameController =
            TextEditingController();
        final TextEditingController startTimeController =
            TextEditingController();
        final TextEditingController endTimeController = TextEditingController();

        return AlertDialog(
          title: const Text('Add Meeting'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: eventNameController,
                decoration: const InputDecoration(labelText: 'Event Name'),
              ),
              TextField(
                controller: startTimeController,
                decoration: const InputDecoration(
                    labelText: 'Start Time (yyyy-MM-dd HH:mm)'),
              ),
              TextField(
                controller: endTimeController,
                decoration: const InputDecoration(
                    labelText: 'End Time (yyyy-MM-dd HH:mm)'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                final String eventName = eventNameController.text;
                final DateTime startTime =
                    DateTime.parse(startTimeController.text);
                final DateTime endTime = DateTime.parse(endTimeController.text);

                setState(() {
                  meetings.add(Meeting(
                      eventName, startTime, endTime, Colors.black, true));
                });

                Navigator.of(context).pop();
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }
}

List<Meeting> _getDataSource() {
  final List<Meeting> meetings = <Meeting>[];
  final DateTime today = DateTime.now();
  final DateTime startTime =
      DateTime(today.year, today.month, today.day, 9, 0, 0);
  final DateTime endTime = startTime.add(const Duration(hours: 2));
  // meetings.add(Meeting(
  //     'Conference', startTime, endTime, const Color(0xFF0F8644), false));
  return meetings;
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].to;
  }

  @override
  String getSubject(int index) {
    return appointments![index].eventName;
  }

  @override
  Color getColor(int index) {
    return appointments![index].background;
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].isAllDay;
  }
}

class Meeting {
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;
}
