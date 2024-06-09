import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:view_finder/domain/use_case/get_member_use_case.dart';
import 'package:view_finder/domain/use_case/get_posts_use_case.dart';
import '../../../domain/model/member.dart';
import '../../../domain/model/post.dart';
import '../../../domain/use_case/get_user_posts_use_case.dart';

@injectable
class AccountViewModel with ChangeNotifier {
  final GetMemberUseCase _getMemberUseCase;
  final GetPostsUseCase _getPostsUseCase;
  final GetUserPostsUseCase _getUserPostsUseCase;

  AccountViewModel({
    required GetMemberUseCase getMemberUseCase,
    required GetPostsUseCase getPostsUseCase,
    required GetUserPostsUseCase getUserPostsUseCase,
  })  : _getMemberUseCase = getMemberUseCase,
        _getPostsUseCase = getPostsUseCase,
        _getUserPostsUseCase = getUserPostsUseCase;

  void logout() async {
    await FirebaseAuth.instance.signOut();
  }

  List<Post> _post = [];

  List<Post> get post => List.unmodifiable(_post);

  Future<void> setAllPost() async {
    final post = await _getPostsUseCase.execute();
    _post = post;
    notifyListeners();
  }

  List<Post> _userPost = [];

  List<Post> get userPost => List.unmodifiable(_userPost);

  Future<void> setUserPost(String uid) async {
    final userPost = await _getUserPostsUseCase.execute(uid);
    _userPost = userPost;
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
