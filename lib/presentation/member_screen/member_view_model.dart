import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:view_finder/domain/model/member.dart';

@injectable
class MemberViewModel {
  final _picker = ImagePicker();

  Future<File?> getImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image == null) {
      return null;
    }

    return File(image.path);
  }

  Future<void> setMembers(String title, String content, File imageFile) async {
    String downloadUrl = '기본이미지';
    // 이미지 업로드
    final storageRef = FirebaseStorage.instance.ref();
    final imageRef = storageRef
        .child('memberImages/${DateTime.now().millisecondsSinceEpoch}.png');

    // 이미지 url 얻기
    await imageRef.putFile(imageFile);
    downloadUrl = await imageRef.getDownloadURL();

    // 게시물 업로드
    final membersRef =
        //  데이터로 변환
        FirebaseFirestore.instance.collection('members').withConverter<Member>(
              // 가져올 때 User 형태로 변환
              fromFirestore: (snapshot, _) => Member.fromJson(snapshot.data()!),
              //파이어스토어에 쓸 때는 json 형태로
              toFirestore: (member, _) => member.toJson(),
            );

    final newMemberRef = membersRef.doc();

    newMemberRef.set(Member(
      userId: FirebaseAuth.instance.currentUser?.uid ?? '',
      email: FirebaseAuth.instance.currentUser?.email ?? '',
      profilePic: downloadUrl,
      createdAt: DateTime.now().toString(),
    ));
  }
}
