import 'package:freezed_annotation/freezed_annotation.dart';

part 'post.freezed.dart';

part 'post.g.dart';

@freezed
class Post with _$Post {
  const factory Post({
    required String postId,
    required String userId,
    required String userNickName,
    required String userProfilePic,
    required String title,
    required String content,
    required String createdAt,
    required String imageUrl,
    required Map<String, dynamic> metaData,
    @Default([]) List<String> likes,
  }) = _Post;

  factory Post.fromJson(Map<String, Object?> json) => _$PostFromJson(json);
}
