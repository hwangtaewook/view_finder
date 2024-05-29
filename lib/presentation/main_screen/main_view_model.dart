import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import '../../domain/model/post.dart';
import '../../domain/use_case/get_posts_use_case.dart';

@injectable
class MainViewModel with ChangeNotifier {
  final GetPostsUseCase _getPostsUseCase;

  MainViewModel({
    required GetPostsUseCase getPostsUseCase,
  }) : _getPostsUseCase = getPostsUseCase;

  List<Post> _post = [];

  List<Post> get post => List.unmodifiable(_post);

  Future<void> setAllPost(String uid) async {
    final post = await _getPostsUseCase.execute(uid);
    _post = post;
    notifyListeners();
  }
}
