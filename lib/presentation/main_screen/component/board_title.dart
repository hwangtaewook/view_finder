import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BoardTitle extends StatelessWidget {
  final String boardName;
  final Function() function;

  const BoardTitle({
    super.key,
    required this.boardName,
    required this.function,
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
                GestureDetector(
                  onTap: function,
                  child: const Align(
                    alignment: Alignment.centerRight,
                    child: Text('더보기'),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 0.02.sh,
            ),
          ],
        ),
      ),
    );
  }
}
