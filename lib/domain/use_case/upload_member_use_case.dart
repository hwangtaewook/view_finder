import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:view_finder/data/services/image_upload_service.dart';
import 'package:view_finder/domain/model/member.dart';

@Singleton()
class UploadMemberUseCase {
  final ImageUploadService _imageUploadService;

  const UploadMemberUseCase({
    required ImageUploadService imageUploadService,
  }) : _imageUploadService = imageUploadService;

  Future<void> execute(String lastName, String firstName, String nickName,
      File imageFile) async {
    String downloadUrl = '기본이미지';
    // 이미지 업로드

    downloadUrl = await _imageUploadService.uploadImage(imageFile);

    // 멤버 업로드
    final uid = FirebaseAuth.instance.currentUser!.uid;
    final membersRef =
        // Member 데이터로 변환
        FirebaseFirestore.instance
            .collection('members')
            .doc(uid)
            .withConverter<Member>(
              // 가져올 때 Post 형태로 변환
              fromFirestore: (snapshot, _) => Member.fromJson(snapshot.data()!),
              // 파이어스토어에 쓸 때는 json 형태로
              toFirestore: (member, _) => member.toJson(),
            );

    final newMemberRef = membersRef;

    newMemberRef.set(Member(
      userId: uid,
      userName: '$lastName$firstName',
      email: FirebaseAuth.instance.currentUser?.email ?? '',
      profilePic: downloadUrl,
      createdAt: DateTime.now().toString(),
    ));
  }
}
