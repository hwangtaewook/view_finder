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
      context.read<PhotoViewModel>().setMember(user.uid);
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    context.read<PhotoViewModel>().setAllPost();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<PhotoViewModel>();

    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            const CustomAppBar(
              screenName: '사진',
            ),
            SliverPadding(
              padding: EdgeInsets.all(0.04.sw),
              sliver: SliverMasonryGrid.count(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                itemBuilder: (BuildContext context, int index) {
                  return ListenableBuilder(
                      listenable: viewModel,
                      builder: (context, child) {
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
                      });
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
