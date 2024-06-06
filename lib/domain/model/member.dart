import 'package:freezed_annotation/freezed_annotation.dart';

part 'member.freezed.dart';

part 'member.g.dart';

@freezed
class Member with _$Member {
  const factory Member({
    required String userId,
    required String userName,
    required String userNickName,
    required String email,
    String profilePic,
    String createdAt,
  }) = _Member;

  factory Member.fromJson(Map<String, Object?> json) => _$MemberFromJson(json);
}
