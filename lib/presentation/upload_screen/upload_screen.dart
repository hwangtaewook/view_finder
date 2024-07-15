import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:view_finder/presentation/component/custom_text_field.dart';
import 'package:view_finder/presentation/upload_screen/upload_view_model.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
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
    final viewModel = context.watch<UploadViewModel>();
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                centerTitle: true,
                toolbarHeight: 0.055.sh,
                title: Text(
                  '사진 등록',
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
              SliverToBoxAdapter(child: SizedBox(height: 0.05.sw)),
              SliverToBoxAdapter(
                child: GestureDetector(
                  onTap: () async {
                    _image = await viewModel.getImage();
                    setState(() {});
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0.04.sw),
                    child: Container(
                      height: 0.07.sh,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color(0xff355E3B),
                      ),
                      child: Center(
                        child: Text(
                          '이미지 선택',
                          style:
                              TextStyle(color: Colors.white, fontSize: 14.sp),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 0.05.sw)),
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 0.04.sw),
                sliver: SliverToBoxAdapter(
                  child: CustomTextField(
                    controller: _titleTextEditingController,
                    fieldName: '제목',
                    hintText: '제목을 입력하세요',
                  ),
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 0.05.sw)),
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 0.04.sw),
                sliver: SliverToBoxAdapter(
                  child: CustomTextField(
                    controller: _detailTextEditingController,
                    fieldName: '내용',
                    hintText: '내용을 입력하세요',
                    height: 0.2.sh,
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: Spacer(),
              ),
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
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
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 0.03.sh,
                          horizontal: 0.04.sw,
                        ),
                        child: Container(
                          height: 0.07.sh,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: const Color(0xff355E3B),
                          ),
                          child: Center(
                            child: Text(
                              '등록하기',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 14.sp),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (_isLoading)
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
