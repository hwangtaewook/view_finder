import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:view_finder/presentation/auth/component/custom_text_filed.dart';
import 'member_detail_view_model.dart';

class MemberDetailScreen extends StatefulWidget {
  const MemberDetailScreen({super.key});

  @override
  State<MemberDetailScreen> createState() => _MemberDetailScreenState();
}

class _MemberDetailScreenState extends State<MemberDetailScreen> {
  File? _image;

  final _lastNameTextEditingController = TextEditingController();

  final _firstNameTextEditingController = TextEditingController();

  final _nickNameTextEditingController = TextEditingController();

  final _emailTextEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<MemberDetailViewModel>();
    });
  }

  @override
  void dispose() {
    // 추가된 부분: 컨트롤러 정리
    _lastNameTextEditingController.dispose();
    _firstNameTextEditingController.dispose();
    _nickNameTextEditingController.dispose();
    _emailTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<MemberDetailViewModel>();

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
                      fieldName: '이름',
                      hintText: '이름을 입력하세요',
                    ),
                  ],
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 0.06.sw)),
              SliverToBoxAdapter(
                child: CustomTextFiled(
                  controller: _nickNameTextEditingController,
                  fieldName: '닉네임',
                  hintText: '닉네임을 입력하세요',
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
              SliverToBoxAdapter(
                child: Center(
                  child: SizedBox(
                    height: 0.3.sh,
                    width: 0.3.sh,
                    child: _image == null
                        ? Icon(
                            Icons.add_photo_alternate_outlined,
                            size: 0.3.sh,
                          )
                        : Image.file(
                            _image!,
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: ElevatedButton(
                  onPressed: () async {
                    _image = await viewModel.getImage();
                    setState(() {});
                  },
                  child: const Text('프로필 이미지 선택'),
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 0.06.sw)),
              SliverToBoxAdapter(
                child: ElevatedButton(
                  onPressed: () async {
                    viewModel.uploadMember(
                        _lastNameTextEditingController.text,
                        _firstNameTextEditingController.text,
                        _nickNameTextEditingController.text,
                        _image!);
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
