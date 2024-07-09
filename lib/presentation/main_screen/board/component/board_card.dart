import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BoardCard extends StatelessWidget {
  final String userProfilePic;
  final String userNickName;
  final String createdAt;
  final String title;
  final String content;
  final String? startDay;
  final String? endDay;

  const BoardCard(
      {super.key,
      required this.userProfilePic,
      required this.userNickName,
      required this.createdAt,
      required this.title,
      required this.content,
      this.startDay,
      this.endDay});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0.04.sw),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipOval(
                child: Image.network(
                  height: 0.1.sw,
                  width: 0.1.sw,
                  userProfilePic,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                width: 0.025.sw,
              ),
              Flexible(
                fit: FlexFit.loose,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          userNickName,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        Text(
                          createdAt.substring(2, 10),
                        ),
                      ],
                    ),
                    Text(
                      title,
                      style: TextStyle(
                          fontSize: 17.sp, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 0.01.sh,
                    ),
                    if (startDay != null && endDay != null)
                      Text(
                        '$startDay ~ $endDay',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xff355E3B),
                        ),
                      ),
                    if (startDay != null && endDay != null)
                      SizedBox(
                        height: 0.01.sh,
                      ),
                    Text(content),
                    SizedBox(
                      height: 0.01.sh,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.favorite_border,
                          size: 20,
                        ),
                        SizedBox(width: 0.04.sw),
                        const Icon(
                          Icons.comment_outlined,
                          size: 20,
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.more_horiz,
                          size: 20,
                        ),
                        SizedBox(width: 0.03.sw),
                      ],
                    ),
                    SizedBox(height: 0.01.sh),
                  ],
                ),
              ),
            ],
          ),
          Divider(
            color: const Color(0xff355E3B).withOpacity(0.5),
          ),
          SizedBox(height: 0.01.sh),
        ],
      ),
    );
  }
}
