import 'dart:async';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';

@Singleton()
class ImageUploadService {
  Future<String> uploadImage(File imageFile) async {
    // 이미지 업로드
    final storageRef = FirebaseStorage.instance.ref();
    final imageRef = storageRef
        .child('memberImages/${DateTime.now().millisecondsSinceEpoch}.png');

    // 이미지 url 얻기
    await imageRef.putFile(imageFile);
    return await imageRef.getDownloadURL();
  }
}
