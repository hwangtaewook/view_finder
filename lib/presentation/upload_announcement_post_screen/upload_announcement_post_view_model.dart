import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import '../../domain/model/announcement_post.dart';
import '../../domain/use_case/upload_announcement_post_use_case.dart';

@injectable
class UploadAnnouncementPostViewModel with ChangeNotifier {
  final UploadAnnouncementPostUseCase _uploadAnnouncementPostUseCase;

  UploadAnnouncementPostViewModel({
    required UploadAnnouncementPostUseCase uploadAnnouncementPostUseCase,
  }) : _uploadAnnouncementPostUseCase = uploadAnnouncementPostUseCase;

  final AnnouncementPost _post = const AnnouncementPost(
    postId: '',
    userId: '',
    userNickName: '',
    title: '',
    content: '',
    createdAt: '',
  );

  AnnouncementPost get post => _post;

  Future<void> uploadPost(String title, String content) async {
    await _uploadAnnouncementPostUseCase.execute(title, content);
  }
}
