import 'package:freezed_annotation/freezed_annotation.dart';

part 'like.freezed.dart';

part 'like.g.dart';

@freezed
class Like with _$Like {
  const factory Like({
    required String likeId,
    required String postId,
    required String userId,
    required String createdAt,
  }) = _Like;

  factory Like.fromJson(Map<String, Object?> json) => _$LikeFromJson(json);
}
