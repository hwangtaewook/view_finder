import 'package:flutter/cupertino.dart';
import 'package:view_finder/domain/repository/post_repository.dart';
import '../../domain/model/post.dart';

class NavBarViewModel with ChangeNotifier {
  final PostRepository _postRepository;

  NavBarViewModel({
    required PostRepository postRepository,
  }) : _postRepository = postRepository;

  List<Post> _post = [];

  List<Post> get post => List.unmodifiable(_post);

  Future<void> setAllPost(String uid) async {
    final post = await _postRepository.getAllPosts();
    _post = post;
    notifyListeners();
  }
}
