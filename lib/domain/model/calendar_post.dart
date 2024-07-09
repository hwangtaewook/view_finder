import 'package:freezed_annotation/freezed_annotation.dart';

part 'calendar_post.freezed.dart';

part 'calendar_post.g.dart';

@freezed
class CalendarPost with _$CalendarPost {
  const factory CalendarPost({
    required String postId,
    required String userId,
    required String userNickName,
    required String userProfilePic,
    required String title,
    required String startDay,
    required String endDay,
    required String content,
    required String color,
    required String createdAt,
  }) = _CalendarPost;

  factory CalendarPost.fromJson(Map<String, Object?> json) =>
      _$CalendarPostFromJson(json);
}
