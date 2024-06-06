import '../model/post.dart';

abstract class PostRepository {
  Future<List<Post>> getUserPosts();
  Future<List<Post>> getAllPosts();
}
