import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import '../../../domain/model/member.dart';
import '../../../domain/use_case/get_member_use_case.dart';
import '../../domain/utils/fraction_conversion_util.dart';

@injectable
class DetailPostViewModel with ChangeNotifier {
  final GetMemberUseCase _getMemberUseCase;
  final FractionConversionUtil _fractionConversionService;

  DetailPostViewModel({
    required GetMemberUseCase getMemberUseCase,
    required FractionConversionUtil fractionConversionService,
  })  : _getMemberUseCase = getMemberUseCase,
        _fractionConversionService = fractionConversionService;

  Member _member = const Member(
    userId: '',
    userName: '',
    userNickName: '',
    email: '',
    profilePic: '',
    createdAt: '',
  );

  Member get member => _member;

  Future<void> setMember(String uid) async {
    final member = await _getMemberUseCase.execute(uid);
    _member = member;
    notifyListeners();
  }

  num convert(String? fractionString) {
    return _fractionConversionService.convert(fractionString);
  }
}
