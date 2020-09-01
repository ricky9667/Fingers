import 'package:fingers/widgets/player_button.dart';
import 'package:flutter/material.dart';

class GamePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: GamePanel(),
    );
  }
}

class GamePanel extends StatefulWidget {
  @override
  _GamePanelState createState() => _GamePanelState();
}

class _GamePanelState extends State<GamePanel> {
  List<int> numbers = List.filled(4, 1);
  int chosenIndex = -1;
  int numberLimit = 9;

  void playerOnPressed(int pressedIndex) {
    if (chosenIndex == -1) {
      chosenIndex = pressedIndex;
    } else {
      if (chosenIndex != pressedIndex) {
        numbers[pressedIndex] += numbers[chosenIndex];
        numbers[pressedIndex] =
            (numbers[pressedIndex] > numberLimit) ? 0 : numbers[pressedIndex];
      }
      chosenIndex = -1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              PlayerButton(
                buttonPressed: () {
                  setState(() => playerOnPressed(0));
                  print('Player 1: right hand clicked');
                },
                buttonText: numbers[0] != 0 ? numbers[0].toString() : "",
                backgroundColor: chosenIndex == 0 ? Colors.blue : Colors.white,
              ),
              PlayerButton(
                buttonPressed: () {
                  setState(() => playerOnPressed(1));
                  print('Player 1: left hand clicked');
                },
                buttonText: numbers[1] != 0 ? numbers[1].toString() : "",
                backgroundColor:
                    (chosenIndex == 1 ? Colors.blue : Colors.white),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              PlayerButton(
                buttonPressed: () {
                  setState(() => playerOnPressed(2));
                  print('Player 2: left hand clicked');
                },
                buttonText: numbers[2] != 0 ? numbers[2].toString() : "",
                backgroundColor: (chosenIndex == 2 ? Colors.red : Colors.white),
              ),
              PlayerButton(
                buttonPressed: () {
                  setState(() => playerOnPressed(3));
                  print('Player 2: right hand clicked');
                },
                buttonText: numbers[3] != 0 ? numbers[3].toString() : "",
                backgroundColor: (chosenIndex == 3 ? Colors.red : Colors.white),
              ),
            ],
          )
        ],
      ),
    );
  }
}
