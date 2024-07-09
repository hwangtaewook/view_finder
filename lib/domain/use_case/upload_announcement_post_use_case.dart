import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:view_finder/domain/model/announcement_post.dart';
import 'get_member_use_case.dart';

@Singleton()
class UploadAnnouncementPostUseCase {
  final GetMemberUseCase _getMemberUseCase;

  UploadAnnouncementPostUseCase({
    required GetMemberUseCase getMemberUseCase,
  }) : _getMemberUseCase = getMemberUseCase;

  Future<void> execute(String title, String content) async {
// 게시물 업로드
    final postsRef = FirebaseFirestore.instance
        .collection('announcementPosts')
        .withConverter<AnnouncementPost>(
          fromFirestore: (snapshot, _) =>
              AnnouncementPost.fromJson(snapshot.data()!),
          toFirestore: (post, _) => post.toJson(),
        );

    final newPostRef = postsRef.doc();
    final userId = FirebaseAuth.instance.currentUser?.uid ?? '';
    final getMember = await _getMemberUseCase.execute(userId);
    final userNickName = getMember.userNickName;
    final userProfilePic = getMember.profilePic;

    await newPostRef.set(AnnouncementPost(
      postId: newPostRef.id,
      userId: userId,
      userNickName: userNickName,
      title: title,
      content: content,
      createdAt: DateTime.now().toString(),
      userProfilePic: userProfilePic,
    ));
  }
}
