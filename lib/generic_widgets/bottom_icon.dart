import 'package:flutter/material.dart';

class BottomIcon extends StatelessWidget {
  Color color;
  Icon icon;

  BottomIcon({required this.color, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: color,
        ),
        width: 40,
        height: 40,
        child: icon);
  }
}
