class DateConversionUtil {
  DateTime convertToDate(String dateString) {
    List parts = dateString.split('-');
    int year = int.parse(parts[0]);
    int month = int.parse(parts[1]);
    int day = int.parse(parts[2]);

    // DateTime 객체 생성
    return DateTime(year, month, day);
  }
}
