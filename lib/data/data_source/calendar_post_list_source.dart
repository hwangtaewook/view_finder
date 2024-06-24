import 'dart:ui';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:view_finder/domain/utils/color_conversion_util.dart';
import '../../domain/model/calendar_post.dart';
import '../../domain/utils/date_conversion_util.dart';

class CalendarPostListSource extends CalendarDataSource {
  CalendarPostListSource(List<CalendarPost> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    DateTime startDay =
        DateConversionUtil().convertToDate(appointments![index].startDay);

    return startDay;
  }

  @override
  DateTime getEndTime(int index) {
    DateTime endDay =
        DateConversionUtil().convertToDate(appointments![index].endDay);
    return endDay;
  }

  @override
  String getSubject(int index) {
    return appointments![index].title;
  }

  @override
  Color getColor(int index) {
    Color color =
        ColorConversionUtil().colorConversion(appointments![index].color);
    return color;
  }
}
