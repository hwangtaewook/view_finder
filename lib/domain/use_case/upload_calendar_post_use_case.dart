import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import '../model/calendar_post.dart';
import 'get_member_use_case.dart';

@Singleton()
class UploadCalendarPostUseCase {
  final GetMemberUseCase _getMemberUseCase;

  UploadCalendarPostUseCase({
    required GetMemberUseCase getMemberUseCase,
  }) : _getMemberUseCase = getMemberUseCase;

  Future<void> execute(String title, String startDay, String endDay,
      String color, String content) async {
// 게시물 업로드
    final postsRef = FirebaseFirestore.instance
        .collection('calendarPosts')
        .withConverter<CalendarPost>(
          fromFirestore: (snapshot, _) =>
              CalendarPost.fromJson(snapshot.data()!),
          toFirestore: (post, _) => post.toJson(),
        );

    final newPostRef = postsRef.doc();
    final userId = FirebaseAuth.instance.currentUser?.uid ?? '';
    final getMember = await _getMemberUseCase.execute(userId);
    final userNickName = getMember.userNickName;
    final userProfilePic = getMember.profilePic;

    await newPostRef.set(CalendarPost(
      postId: newPostRef.id,
      userId: userId,
      userNickName: userNickName,
      title: title,
      startDay: startDay,
      endDay: endDay,
      content: content,
      color: color,
      createdAt: DateTime.now().toString(),
      userProfilePic: userProfilePic,
    ));
  }
}
