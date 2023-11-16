import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: const Text(
          "Dice Game",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.yellow,
      ),
      body: const Dice(),
    ),
  ));
}

class Dice extends StatefulWidget {
  const Dice({super.key});

  @override
  State<Dice> createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;
  String message = "You win";
  void leftDice() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      if (leftDiceNumber == 6) {
        print(message);
      }
    });
  }

  void rightDice() {
    setState(() {
      rightDiceNumber = Random().nextInt(6) + 1;
      if (rightDiceNumber == 6) {
        print(message);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextButton(
              onPressed: () {
                leftDice();
              },
              child: Image.asset("images/dice$leftDiceNumber.png"),
            ),
          ),
          const VerticalDivider(
            width: 20,
            thickness: 8,
            color: Colors.black,
          ),
          Expanded(
              child: TextButton(
            onPressed: () {
              rightDice();
            },
            child: Image.asset("images/dice$rightDiceNumber.png"),
          )),
        ],
      ),
    );
  }
}
