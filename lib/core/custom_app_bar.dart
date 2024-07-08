import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget {
  final String screenName;

  const CustomAppBar({
    super.key,
    required this.screenName,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      toolbarHeight: 1.sh > 1.sw ? 0.055.sh : 0.1.sh,
      title: Text(
        screenName,
        style: TextStyle(fontSize: 18.sp),
      ),
      pinned: true,
      scrolledUnderElevation: 0,
    );
  }
}
