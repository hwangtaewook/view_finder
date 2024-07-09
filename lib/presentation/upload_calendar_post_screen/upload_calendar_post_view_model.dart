import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:view_finder/domain/use_case/upload_calendar_post_use_case.dart';
import '../../domain/model/calendar_post.dart';

@injectable
class UploadCalendarPostViewModel with ChangeNotifier {
  final UploadCalendarPostUseCase _uploadCalendarPostUseCase;

  UploadCalendarPostViewModel({
    required UploadCalendarPostUseCase uploadCalendarPostUseCase,
  }) : _uploadCalendarPostUseCase = uploadCalendarPostUseCase;

  final CalendarPost _post = const CalendarPost(
    postId: '',
    userId: '',
    userNickName: '',
    userProfilePic: '',
    title: '',
    startDay: '',
    endDay: '',
    content: '',
    color: '',
    createdAt: '',
  );

  CalendarPost get post => _post;

  Future<void> uploadPost(String title, String startDay, String endDay,
      String color, String content) async {
    await _uploadCalendarPostUseCase.execute(
        title, startDay, endDay, color, content);
  }
}
