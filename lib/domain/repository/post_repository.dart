import '../model/post.dart';

abstract class PostRepository {
  Future<List<Post>> getPost(String uid);
  Future<List<Post>> getAllPosts();
}
