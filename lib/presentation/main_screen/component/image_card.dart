import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageCard extends StatelessWidget {
  final String image;
  final String userImage;
  final String userName;

  const ImageCard({
    super.key,
    required this.image,
    required this.userImage,
    required this.userName,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1.sw,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 0.04.sw),
        child: Column(
          children: [
            Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(image),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 0.02.sh),
                  child: Row(
                    children: [
                      ClipOval(
                        child: Image.network(
                          height: 0.08.sw,
                          width: 0.08.sw,
                          userImage,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        width: 0.05.sw,
                      ),
                      Text(
                        userName,
                        style: TextStyle(fontSize: 18.sp),
                      ),
                      const Spacer(),
                      const Icon(Icons.star_outline),
                      const Icon(Icons.comment_outlined),
                    ],
                  ),
                ),
                SizedBox(height: 0.03.sh)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
