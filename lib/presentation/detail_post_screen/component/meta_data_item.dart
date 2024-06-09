import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MetaDataItem extends StatelessWidget {
  final String? check;
  final String label;
  final String? value;

  const MetaDataItem({
    super.key,
    this.check,
    required this.label,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    if (check == null) {
      return Container();
    } else {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          children: [
            SizedBox(
              width: 0.15.sw,
              child: Text('$label : '),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey[300]),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                child: Text(value!),
              ),
            ),
          ],
        ),
      );
    }
  }
}
