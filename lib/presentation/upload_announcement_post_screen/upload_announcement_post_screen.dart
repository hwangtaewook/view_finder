import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:view_finder/presentation/component/custom_text_field.dart';
import 'package:view_finder/presentation/upload_announcement_post_screen/upload_announcement_post_view_model.dart';

class UploadAnnouncementPostScreen extends StatefulWidget {
  const UploadAnnouncementPostScreen({super.key});

  @override
  State<UploadAnnouncementPostScreen> createState() =>
      _UploadAnnouncementPostScreenState();
}

class _UploadAnnouncementPostScreenState
    extends State<UploadAnnouncementPostScreen> {
  final _titleTextEditingController = TextEditingController();
  final _contentTextEditingController = TextEditingController();
  final _emailTextEditingController = TextEditingController();

  bool isLoading = false;

  @override
  void dispose() {
    _titleTextEditingController.dispose();
    _contentTextEditingController.dispose();
    _emailTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<UploadAnnouncementPostViewModel>();
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            centerTitle: true,
            toolbarHeight: 0.055.sh,
            title: Text(
              '공지 등록',
              style: TextStyle(fontSize: 18.sp),
            ),
            pinned: true,
            scrolledUnderElevation: 0,
            actions: [
              GestureDetector(
                onTap: () async {
                  if (_titleTextEditingController.text.isNotEmpty &&
                      _contentTextEditingController.text.isNotEmpty) {
                    setState(() {
                      isLoading = true;
                    });
                    await viewModel.uploadPost(_titleTextEditingController.text,
                        _contentTextEditingController.text);

                    setState(() {
                      isLoading = false;
                    });

                    if (context.mounted) {
                      Navigator.pop(context);
                    }
                  }
                },
                child: const Padding(
                  padding: EdgeInsets.all(8),
                  child: Icon(
                    Icons.send,
                  ),
                ),
              ),
            ],
          ),
          SliverToBoxAdapter(child: SizedBox(height: 0.1.sw)),
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
          SliverToBoxAdapter(child: SizedBox(height: 0.06.sw)),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 0.04.sw),
            sliver: SliverToBoxAdapter(
              child: CustomTextField(
                controller: _contentTextEditingController,
                fieldName: '내용',
                hintText: '내용을 입력하세요',
                height: 0.25.sh,
              ),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 0.06.sw)),
          SliverToBoxAdapter(child: SizedBox(height: 0.06.sw)),
        ],
      ),
    );
  }
}
