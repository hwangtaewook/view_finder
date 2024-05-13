import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:view_finder/presentation/account/account_view_model.dart';
import 'package:view_finder/presentation/account/component/account_app_bar.dart';

import '../home/component/image_card.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = AccountViewModel();
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            AccountAppBar(
              userName: 'userName',
              viewModel: viewModel,
            ),
            SliverToBoxAdapter(
              child: Stack(
                children: [
                  Column(
                    children: [
                      Image.network(
                        viewModel.getProfileImageUrl(),
                        height: 0.2.sh,
                        width: 1.sw,
                        fit: BoxFit.cover,
                      ),
                      Column(
                        children: [
                          Align(
                            alignment: Alignment.centerRight,
                            child: IconButton(
                              iconSize: 0.04.sh,
                              onPressed: () {},
                              icon: const Icon(
                                Icons.edit,
                                // size: 0.04.sh,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 0.03.sh,
                          ),
                          Text(
                            viewModel.getEmail(),
                          ),
                          Text(
                            viewModel.getNickName(),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 0.05.sh,
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 0.3.sh,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(0.075.sh),
                          child: Image.asset(
                            'assets/1.jpg',
                            height: 0.15.sh,
                            width: 0.15.sh,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const Divider(
                        thickness: 5,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SliverAppBar(
              toolbarHeight: 0.055.sh,
              title: Center(
                child: Text(
                  'Photo',
                  style: TextStyle(fontSize: 18.sp),
                ),
              ),
              pinned: true,
              foregroundColor: Colors.black,
              scrolledUnderElevation: 0,
            ),
            SliverPadding(
              padding: EdgeInsets.all(0.02.sh),
              sliver: const SliverToBoxAdapter(
                child: Column(
                  children: [
                    ImageCard(
                        image: 'assets/123.jpg',
                        userImage: 'assets/123.jpg',
                        userName: '1번'),
                    ImageCard(
                        image: 'assets/back2.jpg',
                        userImage: 'assets/back2.jpg',
                        userName: '2번'),
                    ImageCard(
                        image: 'assets/background.jpg',
                        userImage: 'assets/background.jpg',
                        userName: '3번'),
                  ],
                ),
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
