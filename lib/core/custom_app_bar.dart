import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget {
  final String userImageURL;
  final String screenName;

  const CustomAppBar({
    super.key,
    required this.userImageURL,
    required this.screenName,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      centerTitle: true,
      toolbarHeight: 0.055.sh,
      title: Text(
        screenName,
        style: TextStyle(fontSize: 18.sp),
      ),
      leading: GestureDetector(
        onTap: () {
          context.go('/user_info');
        },
        child: Center(
          child: ClipOval(
            child: Image.network(
              height: 0.08.sw,
              width: 0.08.sw,
              userImageURL,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      pinned: true,
      scrolledUnderElevation: 0,
    );
  }
}
