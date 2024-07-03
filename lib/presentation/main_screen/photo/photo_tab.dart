import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:view_finder/presentation/main_screen/photo/photo_tab_view_model.dart';
import '../../../core/custom_app_bar.dart';

class PhotoTab extends StatefulWidget {
  const PhotoTab({super.key});

  @override
  State<PhotoTab> createState() => _PhotoTabState();
}

class _PhotoTabState extends State<PhotoTab> {
  @override
  void initState() {
    super.initState();
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      Future.microtask(() {
        context.read<PhotoViewModel>().setAllPost();
        context.read<PhotoViewModel>().setMember(user.uid);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<PhotoViewModel>();
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            CustomAppBar(
              userImageURL: viewModel.member.profilePic.isEmpty
                  ? 'https://cdn.pixabay.com/photo/2014/11/30/14/11/cat-551554_1280.jpg'
                  : viewModel.member.profilePic,
              screenName: '사진',
            ),
            SliverPadding(
              padding: EdgeInsets.all(0.04.sw),
              sliver: SliverMasonryGrid.count(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                itemBuilder: (BuildContext context, int index) {
                  final List<String> catPics = [
                    'assets/1.jpg',
                    'assets/2.jpg',
                    'assets/3.jpg',
                    'assets/4.jpg',
                    'assets/5.jpg',
                    'assets/6.jpg',
                    'assets/7.jpg',
                    'assets/8.jpg',
                    'assets/9.jpg',
                    'assets/10.jpg',
                    'assets/11.jpg',
                  ];

                  return GestureDetector(
                    onTap: () {
                      final post = viewModel.post[index];
                      context.push('/detail_post', extra: post);
                    },
                    child: Hero(
                      tag: viewModel.post[index].postId,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          viewModel.post[index].imageUrl,
                          fit: BoxFit.contain,
                        ),
                      ),
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
      ),
    );
  }
}
