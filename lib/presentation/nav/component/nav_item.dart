import 'package:flutter/material.dart';

class NavItem extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;
  final bool selected;

  const NavItem({
    super.key,
    required this.onTap,
    required this.icon,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        highlightColor: Colors.transparent, // 하이라이트 효과 제거
        splashColor: Colors.transparent,
        child: Icon(
          icon,
          color: selected ? Colors.white : Colors.white.withOpacity(0.4),
        ), // 스플래시 효과 제거
      ),
    );
  }
}
