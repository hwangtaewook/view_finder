import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:view_finder/presentation/auth/component/custom_text_filed.dart';

class MemberDetailScreen extends StatelessWidget {
  File? _image;
  final _lastNameTextEditingController = TextEditingController();
  final _firstNameTextEditingController = TextEditingController();
  final _nickNameTextEditingController = TextEditingController();
  final _emailTextEditingController = TextEditingController();

  MemberDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(0.04.sw),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: SizedBox(height: 0.1.sw)),
              SliverToBoxAdapter(
                child: Row(
                  children: [
                    CustomTextFiled(
                      controller: _lastNameTextEditingController,
                      fieldName: '성',
                      hintText: '성을 입력하세요',
                    ),
                    SizedBox(
                      width: 0.02.sw,
                    ),
                    CustomTextFiled(
                      controller: _firstNameTextEditingController,
                      fieldName: '닉네임',
                      hintText: '닉네임을 입력하세요',
                    ),
                  ],
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 0.06.sw)),
              SliverToBoxAdapter(
                child: CustomTextFiled(
                  controller: _firstNameTextEditingController,
                  fieldName: '이름',
                  hintText: '이름을 입력하세요',
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 0.06.sw)),
              SliverToBoxAdapter(
                child: CustomTextFiled(
                  controller: _emailTextEditingController,
                  fieldName: '이메일',
                  hintText: '이메일을 입력하세요',
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 0.06.sw)),
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
                    // _image = await viewModel.getImage();
                    // setState(() {});
                  },
                  child: const Text('프로필 이미지 선택'),
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 0.06.sw)),
              SliverToBoxAdapter(
                child: ElevatedButton(
                  onPressed: () async {
                    // _image = await viewModel.getImage();
                    // setState(() {});
                  },
                  child: const Text('완료'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
