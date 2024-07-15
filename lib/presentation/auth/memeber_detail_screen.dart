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

  bool _isLoading = false;

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
        body: Stack(
          children: [
            CustomScrollView(
              slivers: [
                SliverAppBar(
                  centerTitle: true,
                  toolbarHeight: 0.055.sh,
                  title: Text(
                    '계정 등록',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18.sp),
                  ),
                  pinned: true,
                  scrolledUnderElevation: 0,
                ),
                SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: 0.04.sw),
                  sliver: SliverToBoxAdapter(
                    child: SizedBox(
                      height: 0.01.sh,
                    ),
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: 0.04.sw),
                  sliver: SliverToBoxAdapter(
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
                ),
                SliverToBoxAdapter(child: SizedBox(height: 0.06.sw)),
                SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: 0.04.sw),
                  sliver: SliverToBoxAdapter(
                    child: CustomTextField(
                      controller: _nickNameTextEditingController,
                      fieldName: '닉네임',
                      hintText: '닉네임을 입력하세요',
                    ),
                  ),
                ),
                SliverToBoxAdapter(child: SizedBox(height: 0.06.sw)),
                SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: 0.04.sw),
                  sliver: SliverToBoxAdapter(
                    child: CustomTextField(
                      controller: _emailTextEditingController,
                      fieldName: '이메일',
                      hintText: '이메일을 입력하세요',
                    ),
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
                SliverToBoxAdapter(child: SizedBox(height: 0.05.sh)),
                SliverToBoxAdapter(
                  child: GestureDetector(
                    onTap: () async {
                      if (context.mounted) {
                        _image = await viewModel.getImage();
                        setState(() {});
                      }
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(
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
                            '프로필 이미지 선택',
                            style:
                                TextStyle(color: Colors.white, fontSize: 14.sp),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          if (context.mounted) {
                            setState(() {
                              _isLoading = true;
                            });
                            await viewModel.uploadMember(
                                _lastNameTextEditingController.text,
                                _firstNameTextEditingController.text,
                                _nickNameTextEditingController.text,
                                _image!);
                            setState(() {
                              _isLoading = false;
                            });
                            if (context.mounted) {
                              context.go('/home');
                            }
                          }
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 0.04.sw, vertical: 0.03.sh),
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
      ),
    );
  }
}
