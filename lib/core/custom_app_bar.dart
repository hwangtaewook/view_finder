import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      toolbarHeight: 0.055.sh,
      title: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: ClipOval(
              child: Image.asset(
                height: 0.08.sw,
                width: 0.08.sw,
                userImageURL,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Text(
              screenName,
              style: TextStyle(fontSize: 18.sp),
            ),
          ),
        ],
      ),
      pinned: true,
      scrolledUnderElevation: 0,
    );
  }
}
