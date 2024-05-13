import 'package:firebase_auth/firebase_auth.dart';

class AccountViewModel {
  void logout() async {
    await FirebaseAuth.instance.signOut();
  }

  String getEmail() {
    return FirebaseAuth.instance.currentUser?.email ?? '';
  }

  String getNickName() {
    return FirebaseAuth.instance.currentUser?.displayName ?? '';
  }

  String getProfileImageUrl() {
    return FirebaseAuth.instance.currentUser?.photoURL ??
        'https://cdn.pixabay.com/photo/2024/03/08/09/47/ai-generated-8620359_640.png';
  }
}
