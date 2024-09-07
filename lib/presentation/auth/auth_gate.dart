import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:view_finder/data/data_source/member_data_source.dart';
import 'package:view_finder/data/services/register_check_service.dart';
import 'package:view_finder/presentation/auth/login_screen.dart';
import 'package:view_finder/presentation/auth/memeber_detail_screen.dart';
import 'package:view_finder/presentation/main_screen/home/home_tab.dart';
import 'package:view_finder/presentation/main_screen/home/home_view_model.dart';
import '../../core/di_setup.dart';
import '../main_screen/main_screen.dart';
import 'member_detail_view_model.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const LoginScreen();
          //     SignInScreen(
          //   providers: [
          //     EmailAuthProvider(),
          //   ],
          // );
        }

        return FutureBuilder<bool>(
          future: RegisterCheckService(
            memberDataSource: getIt<MemberDataSource>(),
          ).registerCheck(),
          builder: (context, registerSnapshot) {
            if (registerSnapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (registerSnapshot.hasData &&
                registerSnapshot.data == true) {
              return ChangeNotifierProvider(
                create: (context) => getIt<HomeViewModel>(),
                child: const MainScreen(child: HomeTab()),
              );
            } else {
              return ChangeNotifierProvider(
                  create: (context) => getIt<MemberDetailViewModel>(),
                  child: const MemberDetailScreen());
            }
          },
        );
      },
    );
  }
}
