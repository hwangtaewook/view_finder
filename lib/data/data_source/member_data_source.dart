import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

@Singleton()
class MemberDataSource {
  final FirebaseFirestore _firebaseFirestore;

  MemberDataSource({
    required FirebaseFirestore firebaseFirestore,
  }) : _firebaseFirestore = firebaseFirestore;

  DocumentReference<Map<String, dynamic>> getMemberDocumentRef(String uid) {
    final documentRef = _firebaseFirestore.collection('Members').doc(uid);

    return documentRef;
  }
}
