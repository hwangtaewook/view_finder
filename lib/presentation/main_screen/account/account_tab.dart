import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'account_view_model.dart';
import 'component/account_app_bar.dart';

class AccountTab extends StatelessWidget {
  const AccountTab({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<AccountViewModel>();
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            AccountAppBar(
              userName: 'userName',
              viewModel: viewModel,
            ),
            SliverToBoxAdapter(
              child: Stack(
                children: [
                  Column(
                    children: [
                      Image.network(
                        'https://cdn.pixabay.com/photo/2017/02/20/18/03/cat-2083492_640.jpg',
                        height: 0.2.sh,
                        width: 1.sw,
                        fit: BoxFit.cover,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                          iconSize: 0.03.sh,
                          onPressed: () {},
                          icon: const Icon(
                            Icons.edit,
                            // size: 0.04.sh,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 0.03.sh,
                      ),
                      Text(
                        'asd',
                      ),
                      Text(
                        'qwe',
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 0.05.sh,
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 0.3.sh,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(0.075.sh),
                          child: Image.asset(
                            'assets/1.jpg',
                            height: 0.15.sh,
                            width: 0.15.sh,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const Divider(
                        thickness: 5,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SliverAppBar(
              toolbarHeight: 0.055.sh,
              title: Center(
                child: Text(
                  'Photo',
                  style: TextStyle(fontSize: 18.sp),
                ),
              ),
              pinned: true,
              foregroundColor: Colors.black,
              scrolledUnderElevation: 0,
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [],
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 0.1.sh,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
