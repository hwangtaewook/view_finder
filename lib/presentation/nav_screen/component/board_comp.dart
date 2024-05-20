import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:view_finder/presentation/nav_screen/component/board_card.dart';

class BoardComp extends StatelessWidget {
  final String boardName;
  final String title;
  final String content;

  const BoardComp({
    super.key,
    required this.boardName,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 0.04.sw),
        child: Column(
          children: [
            Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(boardName),
                ),
                const Align(
                  alignment: Alignment.centerRight,
                  child: Text('더보기'),
                ),
              ],
            ),
            BoardCard(title: title, content: content),
            SizedBox(
              height: 0.02.sh,
            ),
          ],
        ),
      ),
    );
  }
}
