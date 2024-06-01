import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:view_finder/domain/use_case/upload_member_use_case.dart';

@injectable
class MemberDetailViewModel with ChangeNotifier {
  final UploadMemberUseCase _uploadMemberUseCase;

  MemberDetailViewModel({
    required UploadMemberUseCase uploadMemberUseCase,
  }) : _uploadMemberUseCase = uploadMemberUseCase;

  Future<void> uploadMember(String lastName, String firstName, String nickName,
      File imageFile) async {
    await _uploadMemberUseCase.execute(
        lastName, firstName, nickName, imageFile);
  }

  final _picker = ImagePicker();

  Future<File?> getImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image == null) {
      return null;
    }

    return File(image.path);
  }
}
