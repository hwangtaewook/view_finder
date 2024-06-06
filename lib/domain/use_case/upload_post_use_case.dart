import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:view_finder/data/services/image_upload_service.dart';
import 'package:view_finder/domain/use_case/get_member_use_case.dart';
import '../model/post.dart';

@Singleton()
class UploadPostUseCase {
  final ImageUploadService _imageUploadService;
  final GetMemberUseCase _getMemberUseCase;

  UploadPostUseCase({
    required ImageUploadService imageUploadService,
    required GetMemberUseCase getMemberUseCase,
  })  : _imageUploadService = imageUploadService,
        _getMemberUseCase = getMemberUseCase;

  Future<void> execute(String title, String content, File imageFile) async {
    String downloadUrl = '기본이미지';
    try {
      downloadUrl = await _imageUploadService.uploadImage(imageFile);
    } catch (e) {
      // Handle the error if image upload fails
      debugPrint('Image upload failed: $e');
    }

    // 게시물 업로드
    final postsRef =
        FirebaseFirestore.instance.collection('posts').withConverter<Post>(
              fromFirestore: (snapshot, _) => Post.fromJson(snapshot.data()!),
              toFirestore: (post, _) => post.toJson(),
            );

    final newPostRef = postsRef.doc();
    final userId = FirebaseAuth.instance.currentUser?.uid ?? '';
    final getMember = await _getMemberUseCase.execute(userId);
    final userName = getMember.userName;
    final userProfilePic = getMember.profilePic;

    await newPostRef.set(Post(
      postId: newPostRef.id,
      userId: userId,
      userName: userName,
      userProfilePic: userProfilePic,
      title: title,
      content: content,
      createdAt: DateTime.now().toString(),
      imageUrl: downloadUrl,
      likes: [],
    ));
  }
}
