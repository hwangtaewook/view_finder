import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:view_finder/domain/model/announcement_post.dart';
import '../../../domain/model/member.dart';
import '../../../domain/model/post.dart';
import '../../../domain/use_case/get_announcement_post_use_case.dart';
import '../../../domain/use_case/get_member_use_case.dart';
import '../../../domain/use_case/get_posts_use_case.dart';

@injectable
class BoardViewModel with ChangeNotifier {
  final GetPostsUseCase _getPostsUseCase;
  final GetMemberUseCase _getMemberUseCase;
  final GetAnnouncementPostUseCase _getAnnouncementPostUseCase;

  BoardViewModel({
    required GetPostsUseCase getPostsUseCase,
    required GetMemberUseCase getMemberUseCase,
    required GetAnnouncementPostUseCase getAnnouncementPostUseCase,
  })  : _getPostsUseCase = getPostsUseCase,
        _getMemberUseCase = getMemberUseCase,
        _getAnnouncementPostUseCase = getAnnouncementPostUseCase;

  List<Post> _post = [];

  List<Post> get post => List.unmodifiable(_post);

  Future<void> setAllPost() async {
    final post = await _getPostsUseCase.execute();
    _post = post;
    notifyListeners();
  }

  List<AnnouncementPost> _announcementPost = [];

  List<AnnouncementPost> get announcementPost =>
      List.unmodifiable(_announcementPost);

  Future<void> setAllAnnouncementPost() async {
    final announcementPost = await _getAnnouncementPostUseCase.execute();
    _announcementPost = announcementPost;
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
