import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:view_finder/domain/use_case/get_member_use_case.dart';
import 'package:view_finder/domain/use_case/get_posts_use_case.dart';
import '../../../domain/model/member.dart';
import '../../../domain/model/post.dart';

@injectable
class AccountViewModel with ChangeNotifier {
  final GetMemberUseCase _getMemberUseCase;
  final GetPostsUseCase _getPostsUseCase;

  AccountViewModel({
    required GetMemberUseCase getMemberUseCase,
    required GetPostsUseCase getPostsUseCase,
  })  : _getMemberUseCase = getMemberUseCase,
        _getPostsUseCase = getPostsUseCase;

  void logout() async {
    await FirebaseAuth.instance.signOut();
  }

  List<Post> _post = [];

  List<Post> get post => List.unmodifiable(_post);

  Future<void> setAllPost(String uid) async {
    final post = await _getPostsUseCase.execute(uid);
    _post = post;
    notifyListeners();
  }

  Member _member = const Member(
      userId: '', userName: '', email: '', profilePic: '', createdAt: '');

  Member get member => _member;

  Future<void> setMember(String uid) async {
    final member = await _getMemberUseCase.execute(uid);
    _member = member;
    notifyListeners();
  }
}
