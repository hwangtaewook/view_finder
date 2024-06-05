import 'package:injectable/injectable.dart';
import 'package:view_finder/domain/repository/member_repository.dart';
import '../model/member.dart';

@Singleton()
class GetMemberUseCase {
  final MemberRepository _memberRepository;

  const GetMemberUseCase({
    required MemberRepository memberRepository,
  }) : _memberRepository = memberRepository;

  Future<Member> execute(String uid) async {
    return await _memberRepository.getMember(uid);
  }
}
