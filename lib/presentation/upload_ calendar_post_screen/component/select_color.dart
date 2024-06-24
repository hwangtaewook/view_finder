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
        height: 45,
        width: 45,
        decoration: BoxDecoration(
          color: widget.color,
          border:
              widget.check ? Border.all(color: Colors.black, width: 3.0) : null,
        ),
      ),
    );
  }
}
