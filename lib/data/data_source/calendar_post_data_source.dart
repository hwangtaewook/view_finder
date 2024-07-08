import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

@Singleton()
class CalendarPostDataSource {
  final FirebaseFirestore _firebaseFirestore;

  CalendarPostDataSource({
    required FirebaseFirestore firebaseFirestore,
  }) : _firebaseFirestore = firebaseFirestore;

  Future<List<DocumentSnapshot<Map<String, dynamic>>>>
      getAllPostDocuments() async {
    final querySnapshot = await _firebaseFirestore
        .collection('calendarPosts')
        .orderBy('createdAt', descending: true)
        .get();
    return querySnapshot.docs;
  }
}
