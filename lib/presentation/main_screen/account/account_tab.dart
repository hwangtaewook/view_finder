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
        context.read<AccountViewModel>().setUserPost('post');
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
              userName: viewModel.member.userNickName,
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
                        '뷰파인더',
                      ),
                      Text(
                        viewModel.member.userName,
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
            SliverPadding(
              padding:
                  EdgeInsets.symmetric(horizontal: 0.04.sw, vertical: 0.02.sw),
              sliver: SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // 3열 그리드
                  crossAxisSpacing: 0.005.sw, // 열 간격
                  mainAxisSpacing: 0.005.sw, // 행 간격
                  childAspectRatio: 1.0, // 너비와 높이 비율
                ),
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return Image.network(
                      viewModel.userPost[index].imageUrl,
                      fit: BoxFit.cover,
                    );
                  },
                  childCount: viewModel.userPost.length, // 아이템 수
                ),
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
