import 'package:injectable/injectable.dart';
import '../../domain/model/calendar_post.dart';
import '../../domain/repository/calendar_post_repository.dart';
import '../data_source/calendar_post_data_source.dart';

@Singleton(as: CalendarPostRepository)
class CalendarPostRepositoryImpl implements CalendarPostRepository {
  final CalendarPostDataSource _calendarPostDataSource;

  const CalendarPostRepositoryImpl({
    required CalendarPostDataSource calendarPostDataSource,
  }) : _calendarPostDataSource = calendarPostDataSource;

  @override
  Future<List<CalendarPost>> getAllPosts() async {
    final postDocs = await _calendarPostDataSource.getAllPostDocuments();
    return postDocs.map((e) => CalendarPost.fromJson(e.data() ?? {})).toList();
  }
}
