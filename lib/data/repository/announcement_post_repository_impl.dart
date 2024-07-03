import 'package:injectable/injectable.dart';
import 'package:view_finder/domain/model/announcement_post.dart';
import '../../domain/repository/announcement_post_repository.dart';
import '../data_source/announcement_post_data_source.dart';

@Singleton(as: AnnouncementPostRepository)
class AnnouncementPostRepositoryImpl implements AnnouncementPostRepository {
  final AnnouncementPostDataSource _announcementPostDatSoucre;

  const AnnouncementPostRepositoryImpl({
    required AnnouncementPostDataSource announcementPostDatSoucre,
  }) : _announcementPostDatSoucre = announcementPostDatSoucre;

  @override
  Future<List<AnnouncementPost>> getAllPosts() async {
    final postDocs = await _announcementPostDatSoucre.getAllPostDocuments();
    return postDocs
        .map((e) => AnnouncementPost.fromJson(e.data() ?? {}))
        .toList();
  }
}
