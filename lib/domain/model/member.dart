import 'package:freezed_annotation/freezed_annotation.dart';

part 'member.freezed.dart';

part 'member.g.dart';

@freezed
class Member with _$Member {
  const factory Member({
    required String userId,
    required String email,
    required String profilePic,
    required String createdAt,
    required String clubId,
    required String clubPic,
  }) = _Member;

  factory Member.fromJson(Map<String, Object?> json) => _$MemberFromJson(json);
}
