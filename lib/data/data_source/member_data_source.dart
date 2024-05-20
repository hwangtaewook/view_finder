import 'package:cloud_firestore/cloud_firestore.dart';

class UserDataSource {
  final FirebaseFirestore _firebaseFirestore;

  UserDataSource({
    required FirebaseFirestore firebaseFirestore,
  }) : _firebaseFirestore = firebaseFirestore;

  DocumentReference<Map<String, dynamic>> getMemberDocumentRef(String uid) {
    final documentRef = _firebaseFirestore.collection('Members').doc(uid);

    return documentRef;
  }
}
