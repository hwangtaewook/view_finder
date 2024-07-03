import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

@Singleton()
class AnnouncementPostDataSource {
  final FirebaseFirestore _firebaseFirestore;

  const AnnouncementPostDataSource({
    required FirebaseFirestore firebaseFirestore,
  }) : _firebaseFirestore = firebaseFirestore;

  Future<List<DocumentSnapshot<Map<String, dynamic>>>>
      getAllPostDocuments() async {
    final querySnapshot =
        await _firebaseFirestore.collection('announcementPosts').get();
    return querySnapshot.docs;
  }
}
