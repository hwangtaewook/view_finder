import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BoardCard extends StatelessWidget {
  final String title;
  final String content;
  const BoardCard({
    super.key,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 0.01.sw,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          color: Colors.grey[300],
          height: 0.1.sh,
          width: 1.sw,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 0.03.sw, vertical: 0.01.sw),
                child: Text(
                  title,
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 0.03.sw, vertical: 0.01.sw),
                child: Text(
                  content,
                  style: TextStyle(fontSize: 12.sp),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
