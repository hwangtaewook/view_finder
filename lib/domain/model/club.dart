import 'package:freezed_annotation/freezed_annotation.dart';

part 'club.freezed.dart';

part 'club.g.dart';

@freezed
class Club with _$Club {
  const factory Club({
    required String clubId,
    required String clubName,
    required String description,
    required String createdAt,
    required String clubPic,
  }) = _Club;

  factory Club.fromJson(Map<String, Object?> json) => _$ClubFromJson(json);
}
