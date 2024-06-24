import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:view_finder/presentation/component/custom_text_field.dart';
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
  void dispose() {
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
                    Expanded(
                      child: CustomTextField(
                        controller: _lastNameTextEditingController,
                        fieldName: '성',
                        hintText: '성을 입력하세요',
                      ),
                    ),
                    SizedBox(
                      width: 0.02.sw,
                    ),
                    Expanded(
                      child: CustomTextField(
                        controller: _firstNameTextEditingController,
                        fieldName: '이름',
                        hintText: '이름을 입력하세요',
                      ),
                    ),
                  ],
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 0.06.sw)),
              SliverToBoxAdapter(
                child: CustomTextField(
                  controller: _nickNameTextEditingController,
                  fieldName: '닉네임',
                  hintText: '닉네임을 입력하세요',
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 0.06.sw)),
              SliverToBoxAdapter(
                child: CustomTextField(
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
                    if (context.mounted) {
                      _image = await viewModel.getImage();
                      setState(() {});
                    }
                  },
                  child: const Text('프로필 이미지 선택'),
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 0.06.sw)),
              SliverToBoxAdapter(
                child: ElevatedButton(
                  onPressed: () async {
                    if (context.mounted) {
                      await viewModel.uploadMember(
                          _lastNameTextEditingController.text,
                          _firstNameTextEditingController.text,
                          _nickNameTextEditingController.text,
                          _image!);
                      if (context.mounted) {
                        context.go('/home');
                      }
                    }
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
