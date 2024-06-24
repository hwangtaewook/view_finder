import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:view_finder/domain/utils/date_conversion_util.dart';
import 'package:view_finder/presentation/component/custom_text_field.dart';
import 'package:view_finder/presentation/upload_%20calendar_post_screen/upload_calendar_post_view_model.dart';

import 'component/date_picker_bottom_sheet.dart';
import 'component/select_color.dart';

class UploadCalendarPostScreen extends StatefulWidget {
  const UploadCalendarPostScreen({super.key});

  @override
  State<UploadCalendarPostScreen> createState() =>
      _UploadCalendarPostScreenState();
}

class _UploadCalendarPostScreenState extends State<UploadCalendarPostScreen> {
  final _titleTextEditingController = TextEditingController();
  final _startDayTextEditingController = TextEditingController();
  final _endDayTextEditingController = TextEditingController();
  final _contentTextEditingController = TextEditingController();
  final _emailTextEditingController = TextEditingController();
  Color _selectedColor = const Color(0xffff6666);

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _startDayTextEditingController.text =
        '${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}';
    _endDayTextEditingController.text =
        '${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}';
  }

  @override
  void dispose() {
    _titleTextEditingController.dispose();
    _startDayTextEditingController.dispose();
    _endDayTextEditingController.dispose();
    _contentTextEditingController.dispose();
    _emailTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<UploadCalendarPostViewModel>();
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            centerTitle: true,
            toolbarHeight: 0.055.sh,
            title: Text(
              '일정 등록',
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
                    await viewModel.uploadPost(
                        _titleTextEditingController.text,
                        _startDayTextEditingController.text,
                        _endDayTextEditingController.text,
                        _selectedColor.toString(),
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
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return DatePickerBottomSheet(
                              initialDate: DateConversionUtil().convertToDate(
                                  _startDayTextEditingController.text),
                              onDateSelected: (DateTime selectedDate) {
                                setState(() {});
                                _startDayTextEditingController.text =
                                    '${selectedDate.year}-${selectedDate.month}-${selectedDate.day}';
                              },
                            );
                          },
                        );
                      },
                      child: AbsorbPointer(
                        child: CustomTextField(
                          controller: _startDayTextEditingController,
                          fieldName: '시작일',
                          hintText: '시작일을 선택하세요',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 0.02.sw,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return DatePickerBottomSheet(
                              initialDate: DateConversionUtil().convertToDate(
                                  _endDayTextEditingController.text),
                              onDateSelected: (DateTime selectedDate) {
                                setState(() {});
                                _endDayTextEditingController.text =
                                    '${selectedDate.year}-${selectedDate.month}-${selectedDate.day}';
                              },
                            );
                          },
                        );
                      },
                      child: AbsorbPointer(
                        child: CustomTextField(
                          controller: _endDayTextEditingController,
                          fieldName: '종료일',
                          hintText: '종료일을 선택하세요',
                        ),
                      ),
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
                controller: _contentTextEditingController,
                fieldName: '내용',
                hintText: '내용을 입력하세요',
                height: 0.25.sh,
              ),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 0.06.sw)),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 0.04.sw),
            sliver: SliverToBoxAdapter(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  color: Colors.grey[200],
                  child: Column(
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.fromLTRB(0.04.sw, 0.02.sw, 0.04.sw, 0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '색상',
                            style: TextStyle(fontSize: 10.sp),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.fromLTRB(0.01.sw, 0.02.sw, 0, 0.01.sw),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {});
                                    _selectedColor = const Color(0xffff6666);
                                  },
                                  child: SelectColor(
                                    color: const Color(0xFFff6666),
                                    check: _selectedColor ==
                                        const Color(0xFFff6666),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {});
                                    _selectedColor = const Color(0xffffbd55);
                                  },
                                  child: SelectColor(
                                    color: const Color(0xFFffbd55),
                                    check: _selectedColor ==
                                        const Color(0xFFffbd55),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {});
                                    _selectedColor = const Color(0xffffff66);
                                  },
                                  child: SelectColor(
                                    color: const Color(0xffffff66),
                                    check: _selectedColor ==
                                        const Color(0xffffff66),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {});
                                    _selectedColor = const Color(0xff9de24f);
                                  },
                                  child: SelectColor(
                                    color: const Color(0xff9de24f),
                                    check: _selectedColor ==
                                        const Color(0xff9de24f),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {});
                                    _selectedColor = const Color(0xff87cefa);
                                  },
                                  child: SelectColor(
                                    color: const Color(0xff87cefa),
                                    check: _selectedColor ==
                                        const Color(0xff87cefa),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {});
                                    _selectedColor = const Color(0xfffbc0c0);
                                  },
                                  child: SelectColor(
                                    color: const Color(0xfffbc0c0),
                                    check: _selectedColor ==
                                        const Color(0xfffbc0c0),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {});
                                    _selectedColor = const Color(0xffffdaa1);
                                  },
                                  child: SelectColor(
                                    color: const Color(0xffffdaa1),
                                    check: _selectedColor ==
                                        const Color(0xffffdaa1),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {});
                                    _selectedColor = const Color(0xfff9ffc9);
                                  },
                                  child: SelectColor(
                                    color: const Color(0xfff9ffc9),
                                    check: _selectedColor ==
                                        const Color(0xfff9ffc9),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {});
                                    _selectedColor = const Color(0xffbaffe5);
                                  },
                                  child: SelectColor(
                                    color: const Color(0xffbaffe5),
                                    check: _selectedColor ==
                                        const Color(0xffbaffe5),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {});
                                    _selectedColor = const Color(0xffb9dcff);
                                  },
                                  child: SelectColor(
                                    color: const Color(0xffb9dcff),
                                    check: _selectedColor ==
                                        const Color(0xffb9dcff),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 0.06.sw)),
        ],
      ),
    );
  }
}
