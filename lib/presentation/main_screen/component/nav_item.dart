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
      child: GestureDetector(
        onTap: onTap,
        child: Icon(
          icon,
          color: selected
              ? const Color(0xff355E3B)
              : Colors.black.withOpacity(0.4),
        ),
      ),
    );
  }
}
