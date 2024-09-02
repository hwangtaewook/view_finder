import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import '../model/calendar_post.dart';

@Singleton()
class DeleteCalendarPostUseCase {
  const DeleteCalendarPostUseCase();

  Future<void> execute(String postId) async {
    final postsRef = FirebaseFirestore.instance
        .collection('calendarPosts')
        .withConverter<CalendarPost>(
          fromFirestore: (snapshot, _) =>
              CalendarPost.fromJson(snapshot.data()!),
          toFirestore: (post, _) => post.toJson(),
        );

    final postDocRef = postsRef.doc(postId);
    await postDocRef.delete();
  }
}
