import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:view_finder/domain/use_case/upload_post_use_case.dart';
import '../../domain/model/post.dart';

@injectable
class UploadViewModel with ChangeNotifier {
  final UploadPostUseCase _uploadPostUseCase;

  UploadViewModel({
    required UploadPostUseCase uploadPostUseCase,
  }) : _uploadPostUseCase = uploadPostUseCase;

  final Post _post = const Post(
    postId: '',
    userId: '',
    userNickName: '',
    userProfilePic: '',
    title: '',
    content: '',
    createdAt: '',
    imageUrl: '',
    metaData: {},
  );

  Post get post => _post;

  Future<void> uploadPost(String title, String content, File imageFile) async {
    await _uploadPostUseCase.execute(title, content, imageFile);
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
