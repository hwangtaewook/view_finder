import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import '../model/post.dart';

@Singleton()
class DeletePostUseCase {
  const DeletePostUseCase();

  Future<void> execute(String postId) async {
    final postsRef =
        FirebaseFirestore.instance.collection('posts').withConverter<Post>(
              fromFirestore: (snapshot, _) => Post.fromJson(snapshot.data()!),
              toFirestore: (post, _) => post.toJson(),
            );

    final postDocRef = postsRef.doc(postId);
    await postDocRef.delete();
  }
}
