import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class PhotoScreen extends StatelessWidget {
  const PhotoScreen({super.key});

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
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 0.12.sw,
            title: Stack(
              children: [
                ClipOval(
                  child: Image.asset(
                    height: 0.08.sw,
                    width: 0.08.sw,
                    'assets/back2.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                Center(
                  child: Text(
                    'Photo',
                    style: TextStyle(fontSize: 18.sp),
                  ),
                ),
              ],
            ),
            pinned: true,
            scrolledUnderElevation: 0,
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
    );
  }
}
