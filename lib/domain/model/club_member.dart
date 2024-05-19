import 'package:freezed_annotation/freezed_annotation.dart';

part 'club_member.freezed.dart';

part 'club_member.g.dart';

@freezed
class ClubMember with _$ClubMember {
  const factory ClubMember({
    required String clubIdUserId,
    required String clubId,
    required String userId,
    required String joinedAt,
    required bool admin,
  }) = _ClubMember;

  factory ClubMember.fromJson(Map<String, Object?> json) =>
      _$ClubMemberFromJson(json);
}
