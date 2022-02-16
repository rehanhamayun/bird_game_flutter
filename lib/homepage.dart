import 'dart:async';
import 'dart:ffi';

import 'package:bird_game/mybird.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  //initial value
  static double birdY = 0;
  // bird variables

  double initialPos = birdY;
  double height = 0;
  double time = 0;
  double gravity = -4.9; // Gravity strength
  double velocity = 30; // Jump strength by bird

  // Bool values for settings

  bool gameHasStarted = false;

//JUMP METHOD
  void startGame() {
    gameHasStarted = true;
    Timer.periodic(Duration(milliseconds: 10), (timer) {
      //Equation
      height = gravity * time * time + velocity * time;

      setState(() {
        birdY = initialPos - height;
      });

      if (birdY < -1 || birdY < 1) {
        timer.cancel();
      }

      time += 0.01;
    });
  }

  void jump() {
    setState(() {
      time = 0;
      initialPos = birdY;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: startGame,
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                color: Colors.blue,
                child: Center(
                  child: Stack(
                    children: [
                      MyBird(
                        birdY: birdY,
                      ),
                      Container(
                        alignment: Alignment(0, -0.5),
                        child: Text(
                          "T A P   T O   P L A Y ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.brown,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
