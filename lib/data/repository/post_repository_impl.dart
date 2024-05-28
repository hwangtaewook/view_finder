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
  Future<List<Post>> getPost(String uid) async {
    final documentRef = _postDataSource.getPostDocumentRef(uid);
    final postSnapshot = await documentRef.collection('posts').get();

    if (postSnapshot.docs.isEmpty) {
      throw Exception('존재하지 않는 게시물 입니다.');
    }
    return postSnapshot.docs.map((e) => Post.fromJson(e.data())).toList();
  }

  @override
  Future<List<Post>> getAllPosts() async {
    final postDocs = await _postDataSource.getAllPostDocuments();
    final posts = postDocs.map((e) => Post.fromJson(e.data() ?? {})).toList();
    return posts;
  }
}
