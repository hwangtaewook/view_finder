import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:view_finder/presentation/auth/auth_gate.dart';
import 'package:view_finder/presentation/detail_post_screen/detail_post_screen.dart';
import 'package:view_finder/presentation/nav_screen/nav_bar_screen.dart';
import 'package:view_finder/presentation/upload_screen/upload_screen.dart';
import '../domain/model/post.dart';

final router = GoRouter(
  initialLocation: '/sign_in',
  routes: [
    GoRoute(
      path: '/sign_in',
      builder: (context, state) {
        return const AuthGate();
      },
      routes: [
        GoRoute(
          path: 'forgot_password',
          builder: (context, state) {
            return const ForgotPasswordScreen();
          },
        ),
      ],
    ),
    GoRoute(
      path: '/nav_bar',
      builder: (context, state) {
        return const NavBarScreen();
      },
      routes: [
        GoRoute(
          path: 'upload',
          builder: (context, state) {
            return const UploadScreen();
          },
        ),
        GoRoute(
          path: 'detail_post',
          builder: (context, state) {
            final post = state.extra as Post;
            return DetailPostScreen(post: post);
          },
        ),
      ],
    ),
  ],
);
