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
  int chosenIndex, currentPlayer, numberLimit;
  String message = "";

  _GamePanelState() {
    initGame();
  }

  void initGame() {
    chosenIndex = -1;
    currentPlayer = 1;
    numberLimit = 9;
    message = "Player $currentPlayer \'s turn!";
  }

  void endGame(int winner) {
    currentPlayer = winner;
    message = "Player $winner wins!";
  }

  void switchPlayer() {
    currentPlayer = (currentPlayer == 1) ? 2 : 1;
    message = "Player $currentPlayer \'s turn!";
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

  int getWinner() {
    if (numbers[0] == 0 && numbers[1] == 0) return 2;
    if (numbers[2] == 0 && numbers[3] == 0) return 1;
    return 0;
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
    int winner = getWinner();
    if (winner != 0) endGame(winner);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'Player 1',
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.blue,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              PlayerButton(
                buttonPressed: () {
                  setState(() => playerOnPressed(0));
                },
                buttonText: numbers[0] != 0 ? numbers[0].toString() : "",
                backgroundColor: chosenIndex == 0 ? Colors.blue : Colors.white,
              ),
              PlayerButton(
                buttonPressed: () {
                  setState(() => playerOnPressed(1));
                },
                buttonText: numbers[1] != 0 ? numbers[1].toString() : "",
                backgroundColor:
                    (chosenIndex == 1 ? Colors.blue : Colors.white),
              ),
            ],
          ),
          Text(
            message,
            style: TextStyle(
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
              color: (currentPlayer == 1) ? Colors.blue : Colors.red,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              PlayerButton(
                buttonPressed: () {
                  setState(() => playerOnPressed(2));
                },
                buttonText: numbers[2] != 0 ? numbers[2].toString() : "",
                backgroundColor: (chosenIndex == 2 ? Colors.red : Colors.white),
              ),
              PlayerButton(
                buttonPressed: () {
                  setState(() => playerOnPressed(3));
                },
                buttonText: numbers[3] != 0 ? numbers[3].toString() : "",
                backgroundColor: (chosenIndex == 3 ? Colors.red : Colors.white),
              ),
            ],
          ),
          Text(
            'Player 2',
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
