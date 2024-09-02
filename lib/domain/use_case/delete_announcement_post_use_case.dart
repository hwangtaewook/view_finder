import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import '../model/announcement_post.dart';

@Singleton()
class DeleteAnnouncementPostUseCase {
  const DeleteAnnouncementPostUseCase();

  Future<void> execute(String postId) async {
    final postsRef = FirebaseFirestore.instance
        .collection('announcementPosts')
        .withConverter<AnnouncementPost>(
          fromFirestore: (snapshot, _) =>
              AnnouncementPost.fromJson(snapshot.data()!),
          toFirestore: (post, _) => post.toJson(),
        );

    final postDocRef = postsRef.doc(postId);
    await postDocRef.delete();
  }
}
