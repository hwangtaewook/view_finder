import 'package:injectable/injectable.dart';

import '../model/post.dart';
import '../repository/post_repository.dart';

@Singleton()
class GetUserPostsUseCase {
  final PostRepository _postRepository;

  GetUserPostsUseCase({
    required PostRepository postRepository,
  }) : _postRepository = postRepository;

  Future<List<Post>> execute(String uid) async {
    return await _postRepository.getUserPosts();
  }
}
