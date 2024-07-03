import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:view_finder/presentation/main_screen/home/component/schedule_calender.dart';
import '../../../../core/custom_app_bar.dart';
import '../component/image_card.dart';
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
      Future.microtask(() async {
        await context.read<HomeViewModel>().setMember(user.uid);
        await context.read<HomeViewModel>().setAllPost();
        await context.read<HomeViewModel>().setCalendarPost();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<HomeViewModel>();

    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            CustomAppBar(
              userImageURL: viewModel.member.profilePic.isEmpty
                  ? 'https://cdn.pixabay.com/photo/2023/02/08/18/36/tawny-owl-7777285_640.jpg'
                  : viewModel.member.profilePic,
              screenName: '홈',
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 0.01.sh,
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 600,
                child: ScheduleCalendar(
                  calendarPosts: viewModel.calendarPost,
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
                      context.push('/detail_post', extra: post);
                    },
                    child: Hero(
                      tag: viewModel.post[index].postId,
                      child: ImageCard(
                        image: viewModel.post[index].imageUrl,
                        userImage: viewModel.post[index].userProfilePic,
                        userNickName: viewModel.post[index].userNickName,
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
