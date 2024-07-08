import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:view_finder/data/data_source/calendar_post_list_source.dart';
import '../../../../domain/model/calendar_post.dart';

class ScheduleCalendar extends StatefulWidget {
  final List<CalendarPost> calendarPosts;

  const ScheduleCalendar({super.key, required this.calendarPosts});

  @override
  State<ScheduleCalendar> createState() => _ScheduleCalendarState();
}

class _ScheduleCalendarState extends State<ScheduleCalendar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0.04.sw),
      child: Column(
        children: [
          Expanded(
            child: SfCalendar(
              todayHighlightColor: const Color(0xff355E3B),
              cellBorderColor: Colors.grey[200],
              view: CalendarView.month,
              selectionDecoration: BoxDecoration(
                  color: const Color(0xff355E3B).withOpacity(0.1)),
              headerDateFormat: ' yy년 M월',
              headerStyle: const CalendarHeaderStyle(
                  textAlign: TextAlign.start,
                  backgroundColor: Colors.white,
                  textStyle: TextStyle(color: Colors.black)),
              dataSource: CalendarPostListSource(widget.calendarPosts),
              monthViewSettings: const MonthViewSettings(
                  appointmentDisplayMode:
                      MonthAppointmentDisplayMode.appointment),
            ),
          ),
        ],
      ),
    );
  }
}
