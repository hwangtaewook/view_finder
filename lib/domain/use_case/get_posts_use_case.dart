import 'package:injectable/injectable.dart';
import 'package:view_finder/domain/repository/post_repository.dart';
import '../model/post.dart';

@Singleton()
class GetPostsUseCase {
  final PostRepository _postRepository;

  GetPostsUseCase({
    required PostRepository postRepository,
  }) : _postRepository = postRepository;

  Future<List<Post>> execute(String uid) async {
    return await _postRepository.getAllPosts();
  }
}
