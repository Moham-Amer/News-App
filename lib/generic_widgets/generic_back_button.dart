import 'package:flutter/material.dart';

class GenericBackButton extends StatelessWidget {


  VoidCallback onPressFunction;

  GenericBackButton({required this.onPressFunction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.grey.shade100,
        ),
        child: Container(
          margin: EdgeInsets.only(bottom: 3, top: 5),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              shape: CircleBorder(),
            ),
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: onPressFunction,
          ),
        ),
      ),
    );
  }
}
