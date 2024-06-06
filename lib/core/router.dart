import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:view_finder/presentation/auth/auth_gate.dart';
import 'package:view_finder/presentation/auth/member_detail_view_model.dart';
import 'package:view_finder/presentation/auth/memeber_detail_screen.dart';
import 'package:view_finder/presentation/detail_post_screen/detail_post_screen.dart';
import 'package:view_finder/presentation/detail_post_screen/detail_post_view_model.dart';
import 'package:view_finder/presentation/main_screen/account/account_tab.dart';
import 'package:view_finder/presentation/main_screen/account/account_view_model.dart';
import 'package:view_finder/presentation/main_screen/board/board_tab.dart';
import 'package:view_finder/presentation/main_screen/home/home_tab.dart';
import 'package:view_finder/presentation/main_screen/home/home_view_model.dart';
import 'package:view_finder/presentation/main_screen/main_screen.dart';
import 'package:view_finder/presentation/main_screen/photo/photo_tab.dart';
import 'package:view_finder/presentation/upload_screen/upload_screen.dart';
import 'package:view_finder/presentation/upload_screen/upload_view_model.dart';
import '../domain/model/post.dart';
import '../presentation/main_screen/board/board_view_model.dart';
import '../presentation/main_screen/main_view_model.dart';
import '../presentation/main_screen/photo/photo_tab_view_model.dart';
import '../presentation/user_info_screen/user_info_screen.dart';
import 'di_setup.dart';

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
    ShellRoute(
      builder: (context, state, child) {
        return ChangeNotifierProvider(
          create: (context) => getIt<MainViewModel>(),
          child: MainScreen(child: child),
        );
      },
      routes: [
        GoRoute(
          path: '/home',
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              key: state.pageKey,
              child: ChangeNotifierProvider(
                create: (context) => getIt<HomeViewModel>(),
                child: const HomeTab(),
              ),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return child;
              },
            );
          },
        ),
        GoRoute(
          path: '/photo',
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              key: state.pageKey,
              child: ChangeNotifierProvider(
                create: (context) => getIt<PhotoViewModel>(),
                child: const PhotoTab(),
              ),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return child;
              },
            );
          },
        ),
        GoRoute(
          path: '/board',
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              key: state.pageKey,
              child: ChangeNotifierProvider(
                create: (context) => getIt<BoardViewModel>(),
                child: const BoardTab(),
              ),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return child;
              },
            );
          },
        ),
        GoRoute(
          path: '/account',
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              key: state.pageKey,
              child: ChangeNotifierProvider(
                create: (context) => getIt<AccountViewModel>(),
                child: const AccountTab(),
              ),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return child;
              },
            );
          },
        ),
      ],
    ),
    GoRoute(
      path: '/upload',
      builder: (context, state) {
        return ChangeNotifierProvider(
            create: (context) => getIt<UploadViewModel>(),
            child: const UploadScreen());
      },
    ),
    GoRoute(
      path: '/detail_post',
      builder: (context, state) {
        final post = state.extra as Post;
        return DetailPostScreen(post: post);
      },
    ),
    GoRoute(
      path: '/member_info',
      builder: (context, state) {
        return const MemberInfoScreen();
      },
    ),
    GoRoute(
      path: '/member_detail',
      builder: (context, state) {
        return ChangeNotifierProvider(
            create: (context) => getIt<MemberDetailViewModel>(),
            child: const MemberDetailScreen());
      },
    ),
  ],
);
