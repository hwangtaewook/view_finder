import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:view_finder/core/custom_app_bar.dart';
import 'package:view_finder/presentation/main_screen/home/component/schedule_calender.dart';
import 'home_view_model.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  void initState() {
    super.initState();
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      context.read<HomeViewModel>().setMember(user.uid);
      context.read<HomeViewModel>().setCalendarPost();
      context.read<HomeViewModel>().setAllAnnouncementPost();
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    context.read<HomeViewModel>().setCalendarPost();
    context.read<HomeViewModel>().setAllAnnouncementPost();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<HomeViewModel>();

    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            const CustomAppBar(
              screenName: '홈',
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 0.01.sh,
              ),
            ),
            viewModel.announcementPost.isNotEmpty
                ? SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 0.04.sw),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Container(
                          color: const Color(0xff355E3B).withOpacity(0.1),
                          width: 1.sw,
                          height: 0.05.sh,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 0.03.sw, vertical: 0.01.sw),
                                child: Row(
                                  children: [
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 8),
                                      child: Icon(
                                        Icons.campaign_rounded,
                                        color: Color(0xff355E3B),
                                      ),
                                    ),
                                    Text(
                                      viewModel.announcementPost[0].title,
                                      style: TextStyle(
                                          fontSize: 12.sp,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                : SliverToBoxAdapter(
                    child: SizedBox(
                      height: 0.05.sh,
                    ),
                  ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 0.01.sh,
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 550,
                child: ScheduleCalendar(
                  calendarPosts: viewModel.calendarPost,
                ),
              ),
            ),
            // if (viewModel.post.isEmpty)
            //   SliverToBoxAdapter(
            //     child: Center(
            //       child: Padding(
            //         padding: EdgeInsets.all(0.05.sw),
            //         child: const Text(
            //           'No items available',
            //           style: TextStyle(fontSize: 16, color: Colors.grey),
            //         ),
            //       ),
            //     ),
            //   )
            // else
            //   SliverList(
            //     delegate: SliverChildBuilderDelegate((context, index) {
            //       return GestureDetector(
            //         onTap: () {
            //           final post = viewModel.post[index];
            //           context.push('/detail_post', extra: post);
            //         },
            //         child: Hero(
            //           tag: viewModel.post[index].postId,
            //           child: ImageCard(
            //             image: viewModel.post[index].imageUrl,
            //             userImage: viewModel.post[index].userProfilePic,
            //             userNickName: viewModel.post[index].userNickName,
            //           ),
            //         ),
            //       );
            //     }, childCount: viewModel.post.length),
            //   ),
          ],
        ),
      ),
    );
  }
}
