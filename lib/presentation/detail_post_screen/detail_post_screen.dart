import 'package:flutter/material.dart';
import 'package:view_finder/presentation/detail_post_screen/component/detail_post_app_bar.dart';

class DetailPostScreen extends StatelessWidget {
  final String image;
  final String userImage;
  final String userName;

  const DetailPostScreen({
    super.key,
    required this.image,
    required this.userImage,
    required this.userName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          DetailPostAppBar(userName: userName),
        ],
      ),
    );
  }
}
