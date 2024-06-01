import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../account_view_model.dart';

class AccountAppBar extends StatelessWidget {
  final String userName;
  final AccountViewModel viewModel;
  const AccountAppBar({
    super.key,
    required this.userName,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      toolbarHeight: 0.055.sh,
      centerTitle: true,
      title: Text(
        userName,
        style: TextStyle(fontSize: 18.sp),
        textAlign: TextAlign.center,
      ),
      actions: [
        IconButton(
          onPressed: () {
            viewModel.logout();
            context.go('/sign_in');
          },
          icon: const Icon(Icons.exit_to_app),
        ),
      ],
      pinned: true,
      scrolledUnderElevation: 0,
    );
  }
}
