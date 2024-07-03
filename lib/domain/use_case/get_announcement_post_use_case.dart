import 'package:view_finder/domain/model/announcement_post.dart';
import 'package:view_finder/domain/repository/announcement_post_repository.dart';

class GetAnnouncementPostUseCase {
  final AnnouncementPostRepository _announcementPostRepository;

  const GetAnnouncementPostUseCase({
    required AnnouncementPostRepository announcementPostRepository,
  }) : _announcementPostRepository = announcementPostRepository;

  Future<List<AnnouncementPost>> execute() async {
    return await _announcementPostRepository.getAllPosts();
  }
}
