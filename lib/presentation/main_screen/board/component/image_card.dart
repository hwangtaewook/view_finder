import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageCard extends StatelessWidget {
  final String image;
  final String userImage;
  final String userNickName;
  final Function() function;

  const ImageCard({
    super.key,
    required this.image,
    required this.userImage,
    required this.userNickName,
    required this.function,
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
                  padding: EdgeInsets.symmetric(vertical: 0.01.sh),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: function,
                        child: ClipOval(
                          child: Image.network(
                            height: 0.07.sw,
                            width: 0.07.sw,
                            userImage,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 0.03.sw,
                      ),
                      Text(
                        userNickName,
                        style: TextStyle(fontSize: 14.sp),
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.favorite_outline,
                        size: 20,
                      ),
                      SizedBox(
                        width: 0.02.sw,
                      ),
                      const Icon(
                        Icons.comment_outlined,
                        size: 20,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 0.02.sh)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
