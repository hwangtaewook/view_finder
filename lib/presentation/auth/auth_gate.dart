import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:view_finder/presentation/main_screen/home/home_tab.dart';
import 'package:view_finder/presentation/main_screen/home/home_view_model.dart';
import '../../core/di_setup.dart';
import '../main_screen/main_screen.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      //snapshot에 User 정보가 있음
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return SignInScreen(
            providers: [
              EmailAuthProvider(),
            ],
          );
        }
        return ChangeNotifierProvider(
            create: (context) => getIt<HomeViewModel>(),
            child: const MainScreen(child: HomeTab()));
      },
    );
  }
}
