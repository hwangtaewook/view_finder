import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@Singleton()
class PostDataSource {
  final FirebaseFirestore _firebaseFirestore;

  PostDataSource({
    required FirebaseFirestore firebaseFirestore,
  }) : _firebaseFirestore = firebaseFirestore;

  Future<List<DocumentSnapshot<Map<String, dynamic>>>>
      getUserPostsDocument() async {
    final querySnapshot = await _firebaseFirestore
        .collection('posts')
        .where('userId', isEqualTo: FirebaseAuth.instance.currentUser?.uid)
        .get();

    return querySnapshot.docs;
  }

  Future<List<DocumentSnapshot<Map<String, dynamic>>>>
      getAllPostDocuments() async {
    final querySnapshot = await _firebaseFirestore
        .collection('posts')
        .orderBy('createdAt', descending: true)
        .get();
    return querySnapshot.docs;
  }
}
