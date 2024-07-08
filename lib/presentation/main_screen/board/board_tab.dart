import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../component/board_card.dart';
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
        body: DefaultTabController(
          length: 3,
          child: Column(
            children: [
              TabBar(
                indicatorColor: const Color(0xff355E3B),
                unselectedLabelColor: Colors.grey,
                labelColor: Colors.black,
                splashFactory: NoSplash.splashFactory,
                overlayColor: WidgetStateProperty.all(Colors.transparent),
                tabs: const [
                  Tab(
                    text: '공지 게시판',
                  ),
                  Tab(
                    text: '일정 게시판',
                  ),
                  Tab(
                    text: '사진 게시판',
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    CustomScrollView(
                      slivers: [
                        SliverToBoxAdapter(
                          child: SizedBox(
                            height: 0.03.sh,
                          ),
                        ),
                        if (viewModel.announcementPost.isNotEmpty)
                          SliverList(
                            delegate: SliverChildBuilderDelegate(
                              (context, index) {
                                return BoardCard(
                                  title:
                                      viewModel.announcementPost[index].title,
                                  content:
                                      viewModel.announcementPost[index].content,
                                );
                              },
                              childCount: viewModel.announcementPost.length,
                            ),
                          ),
                        SliverToBoxAdapter(
                          child: SizedBox(
                            height: 0.1.sh,
                          ),
                        ),
                      ],
                    ),
                    CustomScrollView(
                      slivers: [
                        SliverToBoxAdapter(
                          child: SizedBox(
                            height: 0.03.sh,
                          ),
                        ),
                        if (viewModel.calendarPost.isNotEmpty)
                          SliverList(
                            delegate: SliverChildBuilderDelegate(
                              (context, index) {
                                return BoardCard(
                                  title: viewModel.calendarPost[index].title,
                                  content:
                                      viewModel.calendarPost[index].content,
                                );
                              },
                              childCount: viewModel.calendarPost.length,
                            ),
                          ),
                        SliverToBoxAdapter(
                          child: SizedBox(
                            height: 0.1.sh,
                          ),
                        ),
                      ],
                    ),
                    CustomScrollView(
                      slivers: [
                        SliverToBoxAdapter(
                          child: SizedBox(
                            height: 0.03.sh,
                          ),
                        ),
                        if (viewModel.post.isNotEmpty)
                          SliverList(
                            delegate: SliverChildBuilderDelegate(
                              (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    final post = viewModel.post[index];
                                    context.push('/detail_post', extra: post);
                                  },
                                  child: ImageCard(
                                    image: viewModel.post[index].imageUrl,
                                    userImage:
                                        viewModel.post[index].userProfilePic,
                                    userNickName:
                                        viewModel.post[index].userNickName,
                                    function: () {
                                      final post = viewModel.post[index];
                                      context.push('/detail_post', extra: post);
                                    },
                                  ),
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
