import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:view_finder/presentation/account/account_view_model.dart';

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
      title: Stack(
        alignment: Alignment.center,
        children: [
          Center(
            child: Text(
              userName,
              style: TextStyle(fontSize: 18.sp),
              textAlign: TextAlign.center,
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              onPressed: () {
                viewModel.logout();
              },
              icon: const Icon(Icons.exit_to_app),
            ),
          ),
        ],
      ),
      pinned: true,
      scrolledUnderElevation: 0,
    );
  }
}
