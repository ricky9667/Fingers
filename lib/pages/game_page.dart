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
  int currentPlayer = 1;
  int numberLimit = 9;

  void switchPlayer() {
    currentPlayer = (currentPlayer == 1) ? 2 : 1;
  }

  void addNumberToIndex({int add, int index}) {
    numbers[index] += add;
    if (numbers[index] > numberLimit) numbers[index] = 0;
  }

  bool isCorrectPlayer(int index) {
    if (currentPlayer == 1) {
      if (index <= 1) return true;
    } else {
      if (index >= 2) return true;
    }
    return false;
  }

  void playerOnPressed(int pressedIndex) {
    if (numbers[pressedIndex] == 0) {
      print('Index $pressedIndex: already dead');
      chosenIndex = -1;
      return;
    }

    if (!isCorrectPlayer(pressedIndex) && chosenIndex == -1) {
      print('You are player $currentPlayer');
      return;
    }

    if (chosenIndex == -1) {
      chosenIndex = pressedIndex;
    } else {
      if (chosenIndex != pressedIndex)
        addNumberToIndex(add: numbers[chosenIndex], index: pressedIndex);
      chosenIndex = -1;
      switchPlayer();
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
