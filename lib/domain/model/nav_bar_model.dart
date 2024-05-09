import 'package:flutter/material.dart';

class NavBarModel {
  final Widget page;
  final GlobalKey<NavigatorState> navKey;

  const NavBarModel({
    required this.page,
    required this.navKey,
  });
}
