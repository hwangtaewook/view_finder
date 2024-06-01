import '../model/member.dart';

abstract class MemberRepository {
  Future<Member> getMember(String uid);
}
