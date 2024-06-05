import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'account_view_model.dart';
import 'component/account_app_bar.dart';

class AccountTab extends StatefulWidget {
  const AccountTab({super.key});

  @override
  State<AccountTab> createState() => _AccountTabState();
}

class _AccountTabState extends State<AccountTab> {
  @override
  void initState() {
    super.initState();
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      Future.microtask(() {
        context.read<AccountViewModel>().setAllPost('post');
        context.read<AccountViewModel>().setMember(user.uid);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<AccountViewModel>();
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            AccountAppBar(
              userName: viewModel.member.userName,
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
                      const Text(
                        'asd',
                      ),
                      const Text(
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
                          child: Image.network(
                            viewModel.member.profilePic.isEmpty
                                ? 'https://cdn.pixabay.com/photo/2017/02/20/18/03/cat-2083492_640.jpg'
                                : viewModel.member.profilePic,
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
            const SliverToBoxAdapter(
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
