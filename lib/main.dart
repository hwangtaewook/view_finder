import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:view_finder/data/data_source/post_data_source.dart';
import 'package:view_finder/data/repository/post_repository_impl.dart';
import 'package:view_finder/presentation/nav_screen/home/home_view_model.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return ChangeNotifierProvider(
      create: (context) => HomeViewModel(
        postRepository: PostRepositoryImpl(
          postDataSource: PostDataSource(
            firebaseFirestore: FirebaseFirestore.instance,
          ),
        ),
      ),
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const SignInScreen(),
      ),
    );
  }
}
