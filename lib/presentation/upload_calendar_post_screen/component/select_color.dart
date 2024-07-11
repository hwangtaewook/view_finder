import 'package:flutter/material.dart';

class SelectColor extends StatefulWidget {
  final Color color;
  final bool check;

  const SelectColor({
    super.key,
    required this.color,
    required this.check,
  });

  @override
  State<SelectColor> createState() => _SelectColorState();
}

class _SelectColorState extends State<SelectColor> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: widget.color,
          border: widget.check
              ? Border.all(color: Colors.white.withOpacity(0.5), width: 4.0)
              : null,
        ),
      ),
    );
  }
}
