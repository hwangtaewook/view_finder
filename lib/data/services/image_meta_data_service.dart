import 'dart:io';
import 'package:exif/exif.dart' as exif;
import 'package:injectable/injectable.dart';

@Singleton()
class ImageMetaDataService {
  Future<Map<String, dynamic>> extractMetadata(File file) async {
    final imageBytes = await file.readAsBytes();
    final tags = await exif.readExifFromBytes(imageBytes);

    Map<String, dynamic> metaDataMap = {};
    tags.forEach((key, value) {
      metaDataMap[key] = value.toString();
    });
    return metaDataMap;
  }
}
