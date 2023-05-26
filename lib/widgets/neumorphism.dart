import 'package:flutter/material.dart';

class neumorphism extends StatelessWidget {
  final String text;
  var color;
  neumorphism({super.key, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 150,
      decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              offset: Offset(5, 5),
              blurRadius: 15,
              spreadRadius: 5,
            ),
            BoxShadow(
              color: color,
              offset: Offset(-4, -4),
              blurRadius: 15,
              spreadRadius: 1,
            )
          ]),
      child: Center(
        child: Padding(
          padding:
          const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            text,
            style: TextStyle(
                color: Colors.grey[50],
                fontFamily: 'Roboto'),
          ),
        ),
      ),
    );
  }
}
