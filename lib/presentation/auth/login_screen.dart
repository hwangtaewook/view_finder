import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:view_finder/data/services/google_sign_in_service.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(
                  height: 0.05.sh,
                ),
                ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.white,
                        Colors.white,
                        Colors.transparent,
                      ],
                      stops: [0.0, 0.4, 0.6, 1.0],
                    ).createShader(bounds);
                  },
                  child: Image.network(
                      width: 1.sw,
                      height: 0.6.sh,
                      fit: BoxFit.cover,
                      'https://firebasestorage.googleapis.com/v0/b/view-finder-3c92c.appspot.com/o/DSC03017.jpg?alt=media&token=2d0eefef-51c4-4ff9-9f65-21d0873c7c16'),
                ),
                GestureDetector(
                  onTap: () async {
                    // GoogleSignInService의 인스턴스를 생성하고 signInWithGoogle 메서드를 호출합니다.
                    await GoogleSignInService().signInWithGoogle();
                  },
                  child: Image.network(
                      'https://firebasestorage.googleapis.com/v0/b/view-finder-3c92c.appspot.com/o/Google%20Login.png?alt=media&token=f814e4d4-4725-458c-ba9f-03dce761d759'),
                ),
                SizedBox(
                  height: 0.05.sh,
                ),
                Image.network(
                    'https://firebasestorage.googleapis.com/v0/b/view-finder-3c92c.appspot.com/o/Kakao%20Login.png?alt=media&token=01d3bfa3-b4e5-4d5d-8bfd-057765bf712f'),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
