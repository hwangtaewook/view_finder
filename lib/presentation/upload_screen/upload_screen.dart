import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:view_finder/presentation/upload_screen/upload_view_model.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  final viewModel = UploadViewModel();

  File? _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            centerTitle: true,
            toolbarHeight: 0.055.sh,
            title: Text(
              'Upload',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18.sp),
            ),
            pinned: true,
            scrolledUnderElevation: 0,
          ),
          if (_image == null)
            SliverToBoxAdapter(
              child: Icon(
                Icons.add_photo_alternate_outlined,
                size: 0.3.sh,
              ),
            ),
          if (_image != null)
            SliverToBoxAdapter(
              child: Image.file(_image!),
            ),
          SliverToBoxAdapter(
            child: ElevatedButton(
              onPressed: () async {
                _image = await viewModel.getImage();
                setState(() {});
              },
              child: Text('이미지 선택'),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        filled: true,
                        hintText: '제목을 입력하세요',
                        fillColor: Colors.white70),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
