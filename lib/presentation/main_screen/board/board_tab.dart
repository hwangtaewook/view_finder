import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:view_finder/core/custom_app_bar.dart';
import '../component/board_comp.dart';
import '../component/image_card.dart';
import 'board_view_model.dart';

class BoardTab extends StatefulWidget {
  const BoardTab({super.key});

  @override
  State<BoardTab> createState() => _BoardTabState();
}

class _BoardTabState extends State<BoardTab> {
  @override
  void initState() {
    super.initState();
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      Future.microtask(() {
        context.read<BoardViewModel>().setAllPost();
        context.read<BoardViewModel>().setMember(user.uid);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<BoardViewModel>();
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            CustomAppBar(
              userImageURL: viewModel.member.profilePic.isEmpty
                  ? 'https://cdn.pixabay.com/photo/2023/02/08/18/36/tawny-owl-7777285_640.jpg'
                  : viewModel.member.profilePic,
              screenName: '게시판',
            ),
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
                      userNickName: viewModel.post[index].userId,
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
