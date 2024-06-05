import 'package:injectable/injectable.dart';
import 'package:view_finder/data/data_source/member_data_source.dart';
import 'package:view_finder/domain/model/member.dart';
import '../../domain/repository/member_repository.dart';

@Singleton(as: MemberRepository)
class MemberRepositoryImpl implements MemberRepository {
  final MemberDataSource _memberDataSource;

  const MemberRepositoryImpl({
    required MemberDataSource memberDataSource,
  }) : _memberDataSource = memberDataSource;

  @override
  Future<Member> getMember(String uid) async {
    final docRef = _memberDataSource.getMemberDocumentRef(uid);
    final docSnapshot = await docRef.get();

    if (docSnapshot.exists) {
      return Member.fromJson(docSnapshot.data()!);
    } else {
      throw Exception('Member not found for UID : $uid');
    }
  }
}
