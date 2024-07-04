import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:view_finder/core/custom_app_bar.dart';
import '../component/board_card.dart';
import '../component/board_title.dart';
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
        context.read<BoardViewModel>().setAllCalendarPost();
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
            const BoardTitle(boardName: '공지사항'),
            if (viewModel.announcementPost.isNotEmpty)
              SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  return BoardCard(
                    title: viewModel.announcementPost[index].title,
                    content: viewModel.announcementPost[index].content,
                  );
                }, childCount: viewModel.announcementPost.length),
              ),
            const BoardTitle(boardName: '일정 게시판'),
            if (viewModel.calendarPost.isNotEmpty)
              SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  return BoardCard(
                    title: viewModel.calendarPost[index].title,
                    content: viewModel.calendarPost[index].content,
                  );
                }, childCount: viewModel.calendarPost.length),
              ),
            const BoardTitle(boardName: '사진 게시판'),
            if (viewModel.post.isNotEmpty)
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return BoardCard(
                      title: viewModel.post[index].title,
                      content: viewModel.post[index].content,
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
