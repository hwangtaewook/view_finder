import 'package:injectable/injectable.dart';
import 'package:view_finder/data/data_source/post_data_source.dart';
import 'package:view_finder/domain/repository/post_repository.dart';

import '../../domain/model/post.dart';

@Singleton(as: PostRepository)
class PostRepositoryImpl implements PostRepository {
  final PostDataSource _postDataSource;

  PostRepositoryImpl({
    required PostDataSource postDataSource,
  }) : _postDataSource = postDataSource;

  @override
  Future<List<Post>> getUserPosts() async {
    final postDocs = await _postDataSource.getUserPostsDocument();
    return postDocs.map((e) => Post.fromJson(e.data() ?? {})).toList();
  }

  @override
  Future<List<Post>> getAllPosts() async {
    final postDocs = await _postDataSource.getAllPostDocuments();
    return postDocs.map((e) => Post.fromJson(e.data() ?? {})).toList();
  }
}
