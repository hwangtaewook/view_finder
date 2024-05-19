import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:view_finder/presentation/nav_screen/photo/photo_page.dart';
import '../home/home_page.dart';
import '../upload_screen/upload_screen.dart';
import 'account/account_page.dart';
import 'board/board_page.dart';
import 'component/nav_item.dart';

class NavBarScreen extends StatefulWidget {
  const NavBarScreen({
    super.key,
  });

  @override
  State<NavBarScreen> createState() => _NavBarScreenState();
}

class _NavBarScreenState extends State<NavBarScreen> {
  int _currentIndex = 0;

  final _pages = [
    const HomePage(),
    const PhotoPage(),
    const BoardPage(),
    const AccountPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _pages[_currentIndex],
          Positioned(
            left: 0,
            right: 0,
            bottom: Platform.isAndroid ? 10 : 0,
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: 0.04.sw, vertical: 0.02.sw),
              child: SizedBox(
                height: 50,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                    child: Container(
                      // color: const Color(0xff323232).withOpacity(0.8),
                      color: const Color(0xffD3D3D3).withOpacity(0.8),
                      child: Row(
                        children: [
                          NavItem(
                            onTap: () {
                              setState(() {});
                              _currentIndex = 0;
                            },
                            icon: Icons.home_outlined,
                            selected: _currentIndex == 0,
                          ),
                          NavItem(
                            onTap: () {
                              setState(() {});
                              _currentIndex = 1;
                            },
                            icon: Icons.camera,
                            selected: _currentIndex == 1,
                          ),
                          NavItem(
                            onTap: () {
                              setState(() {});
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => (const UploadScreen()),
                                ),
                              );
                            },
                            icon: Icons.add_box_outlined,
                            selected: false,
                          ),
                          NavItem(
                            onTap: () {
                              setState(() {});
                              _currentIndex = 2;
                            },
                            icon: Icons.padding,
                            selected: _currentIndex == 2,
                          ),
                          NavItem(
                            onTap: () {
                              setState(() {});
                              _currentIndex = 3;
                            },
                            icon: Icons.person,
                            selected: _currentIndex == 3,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
