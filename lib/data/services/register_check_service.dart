import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:view_finder/data/data_source/member_data_source.dart';

@Singleton()
class RegisterCheckService {
  final MemberDataSource _memberDataSource;

  const RegisterCheckService({
    required MemberDataSource memberDataSource,
  }) : _memberDataSource = memberDataSource;

  Future<bool> registerCheck() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null || user.uid.isEmpty) {
      return false; // 사용자 정보가 없거나 UID가 비어 있는 경우
    }
    final docRef = _memberDataSource.getMemberDocumentRef(user.uid);

    final docSnapshot = await docRef.get();
    return docSnapshot.exists;
  }
}
