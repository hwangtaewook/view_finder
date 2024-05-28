import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:view_finder/presentation/main_screen/photo/photo_tab.dart';
import 'home/home_tab.dart';
import 'account/account_tab.dart';
import 'board/board_tab.dart';
import 'component/nav_item.dart';

class MainScreen extends StatefulWidget {
  final Widget child;
  const MainScreen({
    super.key,
    required this.child,
  });

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          widget.child,
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
                              context.go('/home');
                            },
                            icon: Icons.home_outlined,
                            selected: _currentIndex == 0,
                          ),
                          NavItem(
                            onTap: () {
                              setState(() {});
                              _currentIndex = 1;
                              context.go('/photo');
                            },
                            icon: Icons.camera,
                            selected: _currentIndex == 1,
                          ),
                          NavItem(
                            onTap: () {
                              context.push('/upload');
                            },
                            icon: Icons.add_box_outlined,
                            selected: false,
                          ),
                          NavItem(
                            onTap: () {
                              setState(() {});
                              _currentIndex = 2;
                              context.go('/board');
                            },
                            icon: Icons.padding,
                            selected: _currentIndex == 2,
                          ),
                          NavItem(
                            onTap: () {
                              setState(() {});
                              _currentIndex = 3;
                              context.go('/account');
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
