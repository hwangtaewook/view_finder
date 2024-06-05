import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
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
  final Map<String, int> _pathToIndex = {
    '/home': 0,
    '/photo': 1,
    '/board': 2,
    '/account': 3,
  };

  @override
  Widget build(BuildContext context) {
    final GoRouter router = GoRouter.of(context); //
    final RouteMatchList routerState =
        router.routerDelegate.currentConfiguration;
    final String currentPath = routerState.uri.toString();
    final int currentIndex = _pathToIndex[currentPath] ?? 0;
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
                              context.go('/home');
                            },
                            icon: Icons.home_outlined,
                            selected: currentIndex == 0,
                          ),
                          NavItem(
                            onTap: () {
                              context.go('/photo');
                            },
                            icon: Icons.camera,
                            selected: currentIndex == 1,
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
                              context.go('/board');
                            },
                            icon: Icons.padding,
                            selected: currentIndex == 2,
                          ),
                          NavItem(
                            onTap: () {
                              context.go('/account');
                            },
                            icon: Icons.person,
                            selected: currentIndex == 3,
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
