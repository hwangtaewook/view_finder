import 'package:view_finder/domain/model/announcement_post.dart';

abstract class AnnouncementPostRepository {
  Future<List<AnnouncementPost>> getAllPosts();
}
