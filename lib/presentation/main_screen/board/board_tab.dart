import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:view_finder/core/custom_app_bar.dart';
import '../component/board_comp.dart';
import '../component/image_card.dart';
import '../main_view_model.dart';

class BoardTab extends StatefulWidget {
  final String _uid = 'post';
  const BoardTab({super.key});

  @override
  State<BoardTab> createState() => _BoardTabState();
}

class _BoardTabState extends State<BoardTab> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<MainViewModel>().setAllPost(widget._uid);
    });
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<MainViewModel>();
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            const CustomAppBar(
                userImageURL:
                    'https://cdn.pixabay.com/photo/2023/02/08/18/36/tawny-owl-7777285_640.jpg',
                screenName: '게시판'),
            const BoardComp(
              boardName: '공지사항 게시판',
              title: '제목',
              content: '내용내용내용내용내용내용내용내용내용',
            ),
            const BoardComp(
              boardName: '출사일정 게시판',
              title: '제목',
              content: '내용내용내용내용내용내용내용내용내용',
            ),
            const SliverToBoxAdapter(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Text('사진 게시판'),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text('더보기'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            if (viewModel.post.isNotEmpty)
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return ImageCard(
                      image: viewModel.post[index].imageUrl,
                      userImage: viewModel.post[index].imageUrl,
                      userName: viewModel.post[index].userId,
                    );
                  },
                  childCount: viewModel.post.length,
                ),
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
