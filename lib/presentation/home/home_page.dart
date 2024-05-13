import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:view_finder/presentation/home/component/image_card.dart';

import '../../core/custom_app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            const CustomAppBar(
              userImageURL: 'assets/back2.jpg',
              screenName: 'Home',
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 0.03.sh,
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 0.04.sw),
                child: Column(
                  children: [
                    Column(
                      children: [
                        const Text('공지사항 게시판'),
                        SizedBox(
                          height: 0.01.sh,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            height: 0.3.sh,
                            width: 1.sw,
                            color: Colors.grey[200],
                            child: const Column(
                              children: [
                                Text('게시글'),
                                Text('게시글'),
                                Text('게시글'),
                                Text('게시글'),
                                Text('게시글'),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 0.03.sh,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const Text('출사 게시판'),
                        SizedBox(
                          height: 0.01.sh,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            height: 0.3.sh,
                            width: 1.sw,
                            color: Colors.grey[200],
                            child: const Column(
                              children: [
                                Text('게시글'),
                                Text('게시글'),
                                Text('게시글'),
                                Text('게시글'),
                                Text('게시글'),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 0.03.sh,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 0.04.sw),
                child: Column(
                  children: [
                    const Text('최신 사진'),
                    SizedBox(
                      height: 0.01.sh,
                    ),
                    const ImageCard(
                        image: 'assets/123.jpg',
                        userImage: 'assets/123.jpg',
                        userName: '1번'),
                    const ImageCard(
                        image: 'assets/back2.jpg',
                        userImage: 'assets/back2.jpg',
                        userName: '2번'),
                    const ImageCard(
                        image: 'assets/background.jpg',
                        userImage: 'assets/background.jpg',
                        userName: '3번'),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 0.08.sh,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
