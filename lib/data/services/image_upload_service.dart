import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image/image.dart' as img;
import 'package:injectable/injectable.dart';

@Singleton()
class ImageUploadService {
  Future<String> uploadImage(File imageFile) async {
    Uint8List resizedImageBytes = await _resizeAndCompressImage(imageFile);

    // 이미지 업로드
    final storageRef = FirebaseStorage.instance.ref();
    final imageRef = storageRef
        .child('memberImages/${DateTime.now().millisecondsSinceEpoch}.png');

    // 이미지 url 얻기
    await imageRef.putData(resizedImageBytes);
    return await imageRef.getDownloadURL();
  }

  Future<Uint8List> _resizeAndCompressImage(File imageFile,
      {int maxSize = 500 * 1024,
      int maxDimension = 1280,
      int startingQuality = 100,
      int qualityStep = 10}) async {
    Uint8List imageBytes = await imageFile.readAsBytes();

    // 이미지를 리사이징합니다.
    imageBytes = await _resizeImage(imageBytes, maxDimension);

    int currentQuality = startingQuality;
    int newFileSize = imageBytes.length;

    // 이미지 크기가 maxSize 이하가 될 때까지 품질을 조절하면서 압축합니다.
    while (newFileSize > maxSize && currentQuality > 0) {
      imageBytes = await _compressImage(imageBytes, currentQuality);
      newFileSize = imageBytes.length;
      currentQuality -= qualityStep;
    }

    return imageBytes;
  }

  Future<Uint8List> _resizeImage(Uint8List imageBytes, int maxDimension) async {
    img.Image image = img.decodeImage(imageBytes)!;

    // 이미지의 너비 또는 높이가 maxDimension을 넘는 경우 리사이징합니다.
    if (image.width > maxDimension || image.height > maxDimension) {
      double aspectRatio = image.width / image.height;
      int newWidth, newHeight;

      if (image.width > image.height) {
        newWidth = maxDimension;
        newHeight = (maxDimension / aspectRatio).round();
      } else {
        newHeight = maxDimension;
        newWidth = (maxDimension * aspectRatio).round();
      }

      image = img.copyResize(image, width: newWidth, height: newHeight);
      imageBytes = Uint8List.fromList(img.encodeJpg(image));
    }

    return imageBytes;
  }

  Future<Uint8List> _compressImage(Uint8List imageBytes, int quality) async {
    img.Image image = img.decodeImage(imageBytes)!;
    return Uint8List.fromList(img.encodeJpg(image, quality: quality));
  }
}
