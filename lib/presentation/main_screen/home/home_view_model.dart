import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import '../../../domain/model/member.dart';
import '../../../domain/model/post.dart';
import '../../../domain/use_case/get_member_use_case.dart';
import '../../../domain/use_case/get_posts_use_case.dart';

@injectable
class HomeViewModel with ChangeNotifier {
  final GetPostsUseCase _getPostsUseCase;
  final GetMemberUseCase _getMemberUseCase;

  HomeViewModel({
    required GetPostsUseCase getPostsUseCase,
    required GetMemberUseCase getMemberUseCase,
  })  : _getPostsUseCase = getPostsUseCase,
        _getMemberUseCase = getMemberUseCase;

  List<Post> _post = [];

  List<Post> get post => List.unmodifiable(_post);

  Future<void> setAllPost() async {
    final post = await _getPostsUseCase.execute();
    _post = post;
    notifyListeners();
  }

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
}
