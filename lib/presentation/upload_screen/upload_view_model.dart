import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';

import '../../domain/model/post.dart';

class UploadViewModel {
  final _picker = ImagePicker();

  Future<File?> getImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image == null) {
      return null;
    }

    return File(image.path);
  }

  Future<void> uploadPost(String title, String detail, File imageFile) async {
    final postsRef =
        // Post 데이터로 변환
        FirebaseFirestore.instance.collection('posts').withConverter<Post>(
              // 가져올 때 Post 형태로 변환
              fromFirestore: (snapshot, _) => Post.fromJson(snapshot.data()!),
              //파이어스토어에 쓸 때는 json 형태로
              toFirestore: (post, _) => post.toJson(),
            );

    final newPostRef = postsRef.doc();

    newPostRef.set(Post(
      id: newPostRef.id,
      userId: FirebaseAuth.instance.currentUser?.uid ?? '',
      title: title,
      detail: detail,
      imageUrl:
          'https://cdn.pixabay.com/photo/2024/03/08/09/47/ai-generated-8620359_640.png',
    ));
  }
}
