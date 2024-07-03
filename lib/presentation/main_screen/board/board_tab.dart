import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
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
        context.read<BoardViewModel>().setAllAnnouncementPost();
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
            BoardComp(
              boardName: '공지사항 게시판',
              title: viewModel.announcementPost[0].title,
              content: '내용내용내용내용내용내용내용내용내용',
            ),
            const BoardComp(
              boardName: '출사일정 게시판',
              title: '제목',
              content: '내용내용내용내용내용내용내용내용내용',
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Stack(
                    children: [
                      const Align(
                        alignment: Alignment.center,
                        child: Text('사진 게시판'),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                            onTap: () {
                              context.push('/upload_announcement_post');
                            },
                            child: Text('더보기')),
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
                      userImage: viewModel.post[index].userProfilePic,
                      userNickName: viewModel.post[index].userNickName,
                    );
                  },
                  childCount:
                      viewModel.post.length > 3 ? 3 : viewModel.post.length,
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
