import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String fieldName;
  final String hintText;
  final double height;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.fieldName,
    required this.hintText,
    this.height = 30,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        color: Colors.grey[200],
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0.04.sw, 0.02.sw, 0.04.sw, 0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  fieldName,
                  style: TextStyle(fontSize: 10.sp),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0.01.sw, 0.02.sw, 0, 0.01.sw),
              child: Container(
                constraints:
                    BoxConstraints(maxHeight: height, minHeight: height),
                child: TextFormField(
                  onTapOutside: (e) =>
                      FocusManager.instance.primaryFocus?.unfocus(),
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  controller: controller,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    hintText: hintText,
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                  ),
                  style: TextStyle(fontSize: 12.sp),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
