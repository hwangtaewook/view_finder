import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import '../../../domain/model/post.dart';
import '../../../domain/repository/post_repository.dart';

@injectable
class AccountViewModel with ChangeNotifier {
  final PostRepository _postRepository;

  AccountViewModel({
    required PostRepository postRepository,
  }) : _postRepository = postRepository;

  void logout() async {
    await FirebaseAuth.instance.signOut();
  }

  List<Post> _post = [];

  List<Post> get post => List.unmodifiable(_post);

  Future<void> setAllPost(String uid) async {
    final post = await _postRepository.getAllPosts();
    _post = post;
    notifyListeners();
  }
}
