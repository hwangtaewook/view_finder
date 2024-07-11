import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:view_finder/presentation/main_screen/board/component/board_card.dart';
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
              AppBar(
                toolbarHeight: 0.055.sh,
                centerTitle: true,
                title: Text(
                  '게시판',
                  style: TextStyle(fontSize: 18.sp),
                ),
              ),
              SizedBox(
                height: 0.05.sh,
                child: TabBar(
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorColor: const Color(0xff355E3B),
                  unselectedLabelColor: Colors.grey,
                  labelColor: Colors.black,
                  splashFactory: NoSplash.splashFactory,
                  overlayColor: WidgetStateProperty.all(Colors.transparent),
                  tabs: const [
                    Tab(
                      text: '공지',
                    ),
                    Tab(
                      text: '일정',
                    ),
                    Tab(
                      text: '사진',
                    ),
                  ],
                ),
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
                                  userProfilePic: viewModel
                                      .announcementPost[index].userProfilePic,
                                  userNickName: viewModel
                                      .announcementPost[index].userNickName,
                                  createdAt: viewModel
                                      .announcementPost[index].createdAt,
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
                                  userProfilePic: viewModel
                                      .calendarPost[index].userProfilePic,
                                  userNickName: viewModel
                                      .calendarPost[index].userNickName,
                                  createdAt:
                                      viewModel.calendarPost[index].createdAt,
                                  startDay:
                                      viewModel.calendarPost[index].startDay,
                                  endDay: viewModel.calendarPost[index].endDay,
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
                                  child: BoardCard(
                                    userProfilePic:
                                        viewModel.post[index].userProfilePic,
                                    userNickName:
                                        viewModel.post[index].userNickName,
                                    createdAt: viewModel.post[index].createdAt,
                                    title: viewModel.post[index].title,
                                    content: viewModel.post[index].content,
                                    imageUrl: viewModel.post[index].imageUrl,
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
