import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:view_finder/presentation/detail_post_screen/detail_post_screen.dart';
import '../../../core/custom_app_bar.dart';
import 'component/image_card.dart';
import 'home_view_model.dart';

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
      context.read<HomeViewModel>().setPost(widget._uid);
    });
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<HomeViewModel>();

    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            CustomAppBar(
              userImageURL: viewModel.post[0].imageUrl,
              screenName: 'Home',
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
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPostScreen(
                          image: viewModel.post[index].imageUrl,
                          userImage: viewModel.post[index].imageUrl,
                          userName: viewModel.post[index].title,
                        ),
                      ),
                    );
                  },
                  child: ImageCard(
                    image: viewModel.post[index].imageUrl,
                    userImage: viewModel.post[index].imageUrl,
                    userName: viewModel.post[index].title,
                  ),
                );
              }, childCount: viewModel.post.length),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 0.08.sh,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
