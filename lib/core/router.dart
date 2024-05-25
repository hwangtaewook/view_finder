import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:view_finder/presentation/auth/auth_gate.dart';
import 'package:view_finder/presentation/detail_post_screen/detail_post_screen.dart';
import 'package:view_finder/presentation/nav_screen/account/account_page.dart';
import 'package:view_finder/presentation/nav_screen/nav_bar_screen.dart';
import 'package:view_finder/presentation/upload_screen/upload_screen.dart';
import '../data/data_source/post_data_source.dart';
import '../data/repository/post_repository_impl.dart';
import '../domain/model/post.dart';
import '../presentation/nav_screen/account/account_view_model.dart';
import '../presentation/nav_screen/nav_bar_view_model.dart';

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
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (context) => NavBarViewModel(
                postRepository: PostRepositoryImpl(
                  postDataSource: PostDataSource(
                    firebaseFirestore: FirebaseFirestore.instance,
                  ),
                ),
              ),
              child: const NavBarScreen(),
            ),
            ChangeNotifierProvider(
              create: (context) => AccountViewModel(
                postRepository: PostRepositoryImpl(
                  postDataSource: PostDataSource(
                    firebaseFirestore: FirebaseFirestore.instance,
                  ),
                ),
              ),
              child: const AccountPage(),
            ),
          ],
        );
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
