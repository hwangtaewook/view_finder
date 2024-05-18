import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailPostAppBar extends StatelessWidget {
  final String userName;
  const DetailPostAppBar({
    super.key,
    required this.userName,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      toolbarHeight: 0.055.sh,
      centerTitle: true,
      title: Text(
        userName,
        style: TextStyle(fontSize: 18.sp),
        textAlign: TextAlign.center,
      ),
      pinned: true,
      scrolledUnderElevation: 0,
    );
  }
}
