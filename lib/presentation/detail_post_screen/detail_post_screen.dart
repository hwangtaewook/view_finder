import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
      body: Stack(
        children: [
          Center(
            child: CustomScrollView(
              slivers: [
                SliverFillRemaining(
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
          ),
          DraggableScrollableSheet(
            snap: true,
            initialChildSize: 0.2,
            snapAnimationDuration: const Duration(microseconds: 10),
            minChildSize: 0.2,
            maxChildSize: 0.7,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.0),
                    topRight: Radius.circular(16.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10.0,
                      offset: Offset(0, -2),
                    ),
                  ],
                ),
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: 25,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text('Bottom Sheet Item $index'),
                    );
                  },
                ),
              );
            },
          ),
          SafeArea(
            child: IconButton(
              onPressed: () {
                context.pop();
              },
              icon: const Icon(Icons.arrow_back_ios_new),
            ),
          ),
        ],
      ),
    );
  }
}
