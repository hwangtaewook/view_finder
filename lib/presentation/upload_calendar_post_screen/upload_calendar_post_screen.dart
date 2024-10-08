import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:view_finder/domain/utils/date_conversion_util.dart';
import 'package:view_finder/presentation/component/custom_text_field.dart';
import 'package:view_finder/presentation/upload_calendar_post_screen/upload_calendar_post_view_model.dart';

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
  Color _selectedColor = const Color(0xff355E3B);

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
          ),
          SliverToBoxAdapter(child: SizedBox(height: 0.06.sw)),
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
                                setState(() {
                                  _startDayTextEditingController.text =
                                      '${selectedDate.year}-${selectedDate.month}-${selectedDate.day}';
                                });
                                if (DateConversionUtil()
                                    .convertToDate(
                                        _endDayTextEditingController.text)
                                    .isBefore(selectedDate)) {
                                  _endDayTextEditingController.text =
                                      '${selectedDate.year}-${selectedDate.month}-${selectedDate.day}';
                                }
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
                                setState(() {
                                  _endDayTextEditingController.text =
                                      '${selectedDate.year}-${selectedDate.month}-${selectedDate.day}';
                                });
                                if (DateConversionUtil()
                                    .convertToDate(
                                        _startDayTextEditingController.text)
                                    .isAfter(selectedDate)) {
                                  _startDayTextEditingController.text =
                                      '${selectedDate.year}-${selectedDate.month}-${selectedDate.day}';
                                }
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
          SliverToBoxAdapter(child: SizedBox(height: 0.05.sw)),
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
          SliverToBoxAdapter(child: SizedBox(height: 0.05.sw)),
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
                                    _selectedColor = const Color(0xff141e61);
                                  },
                                  child: SelectColor(
                                    color: const Color(0xff141e61),
                                    check: _selectedColor ==
                                        const Color(0xff141e61),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {});
                                    _selectedColor = const Color(0xff5b4b8a);
                                  },
                                  child: SelectColor(
                                    color: const Color(0xff5b4b8a),
                                    check: _selectedColor ==
                                        const Color(0xff5b4b8a),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {});
                                    _selectedColor = const Color(0xff787a91);
                                  },
                                  child: SelectColor(
                                    color: const Color(0xff787a91),
                                    check: _selectedColor ==
                                        const Color(0xff787a91),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {});
                                    _selectedColor = const Color(0xffd89216);
                                  },
                                  child: SelectColor(
                                    color: const Color(0xffd89216),
                                    check: _selectedColor ==
                                        const Color(0xffd89216),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {});
                                    _selectedColor = const Color(0xffc84b31);
                                  },
                                  child: SelectColor(
                                    color: const Color(0xffc84b31),
                                    check: _selectedColor ==
                                        const Color(0xffc84b31),
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
                                    _selectedColor = const Color(0xff2c3639);
                                  },
                                  child: SelectColor(
                                    color: const Color(0xff2c3639),
                                    check: _selectedColor ==
                                        const Color(0xff2c3639),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {});
                                    _selectedColor = const Color(0xff3f4e4f);
                                  },
                                  child: SelectColor(
                                    color: const Color(0xff3f4e4f),
                                    check: _selectedColor ==
                                        const Color(0xff3f4e4f),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {});
                                    _selectedColor = const Color(0xff355E3B);
                                  },
                                  child: SelectColor(
                                    color: const Color(0xff355E3B),
                                    check: _selectedColor ==
                                        const Color(0xff355E3B),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {});
                                    _selectedColor = const Color(0xffa27b5c);
                                  },
                                  child: SelectColor(
                                    color: const Color(0xffa27b5c),
                                    check: _selectedColor ==
                                        const Color(0xffa27b5c),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {});
                                    _selectedColor = const Color(0xff553939);
                                  },
                                  child: SelectColor(
                                    color: const Color(0xff553939),
                                    check: _selectedColor ==
                                        const Color(0xff553939),
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
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 0.03.sh,
                horizontal: 0.04.sw,
              ),
              child: GestureDetector(
                onTap: () async {
                  if (_titleTextEditingController.text.isNotEmpty &&
                      _contentTextEditingController.text.isNotEmpty) {
                    setState(() {
                      isLoading = true;
                    });
                    try {
                      await viewModel.uploadPost(
                          _titleTextEditingController.text,
                          _startDayTextEditingController.text,
                          _endDayTextEditingController.text,
                          _selectedColor.toString(),
                          _contentTextEditingController.text);
                    } finally {
                      setState(() {
                        isLoading = false;
                      });
                    }

                    if (context.mounted) {
                      Navigator.pop(context);
                    }
                  }
                },
                child: Container(
                  height: 0.07.sh,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color(0xff355E3B),
                  ),
                  child: Center(
                    child: Text(
                      '등록하기',
                      style: TextStyle(color: Colors.white, fontSize: 14.sp),
                    ),
                  ),
                ),
              ),
            ),
          ),
          // SliverToBoxAdapter(child: SizedBox(height: 0.06.sw)),
        ],
      ),
    );
  }
}
