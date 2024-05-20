import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../../../core/custom_app_bar.dart';
import '../component/image_card.dart';
import '../nav_bar_view_model.dart';

class HomePage extends StatefulWidget {
  final String _uid = 'post';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<NavBarViewModel>().setAllPost(widget._uid);
    });
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<NavBarViewModel>();

    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            CustomAppBar(
              userImageURL: viewModel.post.isEmpty
                  ? 'https://cdn.pixabay.com/photo/2023/02/08/18/36/tawny-owl-7777285_640.jpg'
                  : viewModel.post[0].imageUrl,
              screenName: '홈',
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 0.03.sh,
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 0.04.sw),
                child: Column(
                  children: [
                    Column(
                      children: [
                        const Text('공지사항 게시판'),
                        SizedBox(
                          height: 0.01.sh,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            height: 0.3.sh,
                            width: 1.sw,
                            color: Colors.grey[200],
                            child: const Column(
                              children: [
                                Text('게시글'),
                                Text('게시글'),
                                Text('게시글'),
                                Text('게시글'),
                                Text('게시글'),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 0.03.sh,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const Text('출사 게시판'),
                        SizedBox(
                          height: 0.01.sh,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            height: 0.3.sh,
                            width: 1.sw,
                            color: Colors.grey[200],
                            child: const Column(
                              children: [
                                Text('게시글'),
                                Text('게시글'),
                                Text('게시글'),
                                Text('게시글'),
                                Text('게시글'),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 0.03.sh,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  const Text('사진 게시판'),
                  SizedBox(
                    height: 0.01.sh,
                  ),
                ],
              ),
            ),
            if (viewModel.post.isEmpty)
              SliverToBoxAdapter(
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(0.05.sw),
                    child: const Text(
                      'No items available',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ),
                ),
              )
            else
              SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  return GestureDetector(
                    onTap: () {
                      final post = viewModel.post[index];
                      context.push('/nav_bar/detail_post', extra: post);
                    },
                    child: Hero(
                      tag: viewModel.post[index].postId,
                      child: ImageCard(
                        image: viewModel.post[index].imageUrl,
                        userImage: viewModel.post[index].imageUrl,
                        userName: viewModel.post[index].title,
                      ),
                    ),
                  );
                }, childCount: viewModel.post.length),
              ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 0.1.sh,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
