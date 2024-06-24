import '../model/calendar_post.dart';

abstract class CalendarPostRepository {
  Future<List<CalendarPost>> getAllPosts();
}
