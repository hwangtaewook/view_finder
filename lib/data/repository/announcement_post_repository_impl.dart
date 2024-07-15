import 'package:injectable/injectable.dart';
import 'package:view_finder/domain/model/announcement_post.dart';
import '../../domain/repository/announcement_post_repository.dart';
import '../data_source/announcement_post_data_source.dart';

@Singleton(as: AnnouncementPostRepository)
class AnnouncementPostRepositoryImpl implements AnnouncementPostRepository {
  final AnnouncementPostDataSource _announcementPostDataSource;

  const AnnouncementPostRepositoryImpl({
    required AnnouncementPostDataSource announcementPostDataSource,
  }) : _announcementPostDataSource = announcementPostDataSource;

  @override
  Future<List<AnnouncementPost>> getAllPosts() async {
    final postDocs = await _announcementPostDataSource.getAllPostDocuments();
    return postDocs
        .map((e) => AnnouncementPost.fromJson(e.data() ?? {}))
        .toList();
  }
}
