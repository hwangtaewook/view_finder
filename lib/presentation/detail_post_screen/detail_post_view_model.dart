import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import '../../../domain/model/member.dart';
import '../../../domain/use_case/get_member_use_case.dart';

@injectable
class DetailPostViewModel with ChangeNotifier {
  final GetMemberUseCase _getMemberUseCase;

  DetailPostViewModel({
    required GetMemberUseCase getMemberUseCase,
  }) : _getMemberUseCase = getMemberUseCase;

  Member _member = const Member(
      userId: '', userName: '', email: '', profilePic: '', createdAt: '');

  Member get member => _member;

  Future<void> setMember(String uid) async {
    final member = await _getMemberUseCase.execute(uid);
    _member = member;
    notifyListeners();
  }
}
