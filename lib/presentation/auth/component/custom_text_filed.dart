import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFiled extends StatelessWidget {
  final TextEditingController controller;
  final String fieldName;
  final String hintText;

  const CustomTextFiled({
    super.key,
    required this.controller,
    required this.fieldName,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ClipRRect(
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
                child: SizedBox(
                  height: 30,
                  child: TextFormField(
                    controller: controller,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      hintText: hintText,
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
      ),
    );
  }
}
