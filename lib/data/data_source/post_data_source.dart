import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

@Singleton()
class PostDataSource {
  final FirebaseFirestore _firebaseFirestore;

  PostDataSource({
    required FirebaseFirestore firebaseFirestore,
  }) : _firebaseFirestore = firebaseFirestore;

  DocumentReference<Map<String, dynamic>> getPostDocumentRef(String uid) {
    final documentRef = _firebaseFirestore.collection('posts').doc(uid);

    return documentRef;
  }

  Future<List<DocumentSnapshot<Map<String, dynamic>>>>
      getAllPostDocuments() async {
    final querySnapshot = await _firebaseFirestore.collection('posts').get();
    return querySnapshot.docs;
  }
}
