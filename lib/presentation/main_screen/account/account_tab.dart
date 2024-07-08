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
        context.read<AccountViewModel>().setAllPost();
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
              userName: '마이페이지',
              viewModel: viewModel,
            ),
            SliverToBoxAdapter(
              child: StreamBuilder<Object>(
                stream: null,
                builder: (context, snapshot) {
                  return Column(
                    children: [
                      const SizedBox(height: 24),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            if (viewModel.member.profilePic.isNotEmpty)
                              Container(
                                alignment: Alignment.center,
                                height: 0.10.sh,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(0.075.sh),
                                  child: Image.network(
                                    viewModel.member.profilePic,
                                    height: 0.10.sh,
                                    width: 0.10.sh,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            // SizedBox(width: 0.1.sw),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: Container(
                                      color: const Color(0xff355E3B),
                                      child: const Padding(
                                        padding: EdgeInsets.only(
                                            right: 8,
                                            left: 8,
                                            top: 4,
                                            bottom: 4),
                                        child: Text(
                                          '뷰파인더',
                                          style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    viewModel.member.userNickName,
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  shape: BoxShape.circle),
                              child: IconButton(
                                color: Colors.black54,
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.edit_rounded,
                                  size: 20,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 0.03.sh),
                    ],
                  );
                },
              ),
            ),
            SliverGrid(
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
