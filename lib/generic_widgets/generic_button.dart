import 'package:flutter/material.dart';
import '../pages/homepage.dart';

class GenericButton extends StatelessWidget {
  String text;
  int index;

  GenericButton({required this.text, required this.index});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => Homepage(index: index),
          ),
        );
      },
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 30),
      ),
    );
  }
}
