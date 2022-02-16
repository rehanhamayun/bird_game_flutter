import 'package:flutter/material.dart';

class MyBird extends StatelessWidget {
  final birdY;

//Constructor Key value
  MyBird({this.birdY});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(0, birdY),
      child: Image.asset(
        "assets/images/angrybird.png",
        width: 50,
      ),
    );
  }
}
