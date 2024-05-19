import 'package:flutter/material.dart';
import 'package:view_finder/presentation/detail_post_screen/component/detail_post_app_bar.dart';
import '../../domain/model/post.dart';

class DetailPostScreen extends StatelessWidget {
  final Post post;

  const DetailPostScreen({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          DetailPostAppBar(userName: post.userId),
          SliverToBoxAdapter(
            child: Hero(
              tag: post.postId,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.network(post.imageUrl),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
