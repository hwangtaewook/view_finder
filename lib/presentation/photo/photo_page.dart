import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../core/custom_app_bar.dart';

class PhotoPage extends StatelessWidget {
  const PhotoPage({super.key});

  @override
  Widget build(BuildContext context) {
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

    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            const CustomAppBar(
              userImageURL: 'assets/back2.jpg',
              screenName: 'Photo',
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

                  return ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      catPics[index % catPics.length],
                      fit: BoxFit.contain,
                    ),
                  );
                },
                childCount: 30,
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
