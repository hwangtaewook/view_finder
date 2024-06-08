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
      toolbarHeight: 1.sh > 1.sw ? 0.055.sh : 0.1.sh,
      title: Text(
        screenName,
        style: TextStyle(fontSize: 18.sp),
      ),
      leadingWidth: 0.15.sw,
      leading: GestureDetector(
        onTap: () {
          context.go('/member_info');
        },
        child: Padding(
          padding: EdgeInsets.fromLTRB(0.04.sw, 0, 0, 0),
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
      ),
      pinned: true,
      scrolledUnderElevation: 0,
    );
  }
}
