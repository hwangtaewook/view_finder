import 'package:freezed_annotation/freezed_annotation.dart';

part 'announcement_post.freezed.dart';

part 'announcement_post.g.dart';

@freezed
class AnnouncementPost with _$AnnouncementPost {
  const factory AnnouncementPost({
    required String postId,
    required String userId,
    required String userNickName,
    required String title,
    required String content,
    required String createdAt,
  }) = _AnnouncementPost;

  factory AnnouncementPost.fromJson(Map<String, Object?> json) =>
      _$AnnouncementPostFromJson(json);
}
