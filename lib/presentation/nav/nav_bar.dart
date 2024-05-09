import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:view_finder/presentation/account/account_screen.dart';
import 'package:view_finder/presentation/board/board_screen.dart';
import 'package:view_finder/presentation/home/home_screen.dart';
import 'package:view_finder/presentation/photo/photo_screen.dart';

import 'component/nav_item.dart';

class NavBar extends StatefulWidget {
  const NavBar({
    super.key,
  });

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _currentIndex = 0;

  final _pages = [
    HomeScreen(),
    PhotoScreen(),
    BoardScreen(),
    AccountScreen(),
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
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 50,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    color: Colors.black.withOpacity(0.5),
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
        ],
      ),
    );
  }
}
