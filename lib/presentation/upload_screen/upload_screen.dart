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
  final _titleTextEditingController = TextEditingController();
  final _detailTextEditingController = TextEditingController();
  File? _image;

  bool _isLoading = false;

  @override
  void dispose() {
    _titleTextEditingController.dispose();
    _detailTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                centerTitle: true,
                // navpush로 생긴 back 버튼에 밀림 없이 센터로 정렬
                toolbarHeight: 0.055.sh,
                title: Text(
                  'Upload',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18.sp),
                ),
                pinned: true,
                scrolledUnderElevation: 0,
                actions: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0.01.sh),
                    child: GestureDetector(
                      onTap: () async {
                        if (_image != null &&
                            _titleTextEditingController.text.isNotEmpty &&
                            _detailTextEditingController.text.isNotEmpty) {
                          setState(() {
                            _isLoading = true;
                          });
                          await viewModel.uploadPost(
                            _titleTextEditingController.text,
                            _detailTextEditingController.text,
                            _image!,
                          );

                          setState(() {
                            _isLoading = false;
                          });

                          if (context.mounted) {
                            Navigator.pop(context);
                          }
                        }
                      },
                      child: const Icon(
                        Icons.send,
                      ),
                    ),
                  ),
                ],
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
                  child: const Text('이미지 선택'),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      TextField(
                        controller: _titleTextEditingController,
                        onTapOutside: (event) =>
                            FocusManager.instance.primaryFocus?.unfocus(),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            filled: true,
                            hintText: '제목을 입력하세요',
                            fillColor: Colors.white70),
                      ),
                      SizedBox(
                        height: 0.1.sh,
                      ),
                      TextField(
                        controller: _detailTextEditingController,
                        onTapOutside: (event) =>
                            FocusManager.instance.primaryFocus?.unfocus(),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            filled: true,
                            hintText: '내용을 입력하세요',
                            fillColor: Colors.white70),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          if (_isLoading) // 이미지 업로드 중에는 잠금 상태 UI를 표시합니다.
            Container(
              color: Colors.black.withOpacity(0.5),
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
        ],
      ),
    );
  }
}
