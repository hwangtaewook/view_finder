import 'package:injectable/injectable.dart';
import 'package:view_finder/domain/repository/calendar_post_repository.dart';
import '../model/calendar_post.dart';

@Singleton()
class GetCalendarPostUseCase {
  final CalendarPostRepository _calendarPostRepository;

  const GetCalendarPostUseCase({
    required CalendarPostRepository calendarPostRepository,
  }) : _calendarPostRepository = calendarPostRepository;

  Future<List<CalendarPost>> execute() async {
    return await _calendarPostRepository.getAllPosts();
  }
}
