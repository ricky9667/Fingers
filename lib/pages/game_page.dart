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

  void changeNumberValue({int index, int value}) {
    numbers[index] = value;
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
                  setState(() {
                    if (chosenIndex == -1) {
                      chosenIndex = 0;
                    } else if (chosenIndex == 0) {
                      chosenIndex = -1;
                    } else {
                      changeNumberValue(index: 0, value: numbers[0]+numbers[chosenIndex]);
                      chosenIndex = -1;
                    }
                  });
                  print('Player 1: right hand clicked');
                },
                buttonText: numbers[0].toString(),
                backgroundColor: (chosenIndex == 0 ? Colors.blue : Colors.white),
              ),
              PlayerButton(
                buttonPressed: () {
                  setState(() {
                    if (chosenIndex == -1) {
                      chosenIndex = 1;
                    } else if (chosenIndex == 1) {
                      chosenIndex = -1;
                    } else {
                      changeNumberValue(index: 1, value: numbers[1]+numbers[chosenIndex]);
                      chosenIndex = -1;
                    }
                  });
                  print('Player 1: left hand clicked');
                },
                buttonText: numbers[1].toString(),
                backgroundColor: (chosenIndex == 1 ? Colors.blue : Colors.white),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              PlayerButton(
                buttonPressed: () {
                  setState(() {
                    if (chosenIndex == -1) {
                      chosenIndex = 2;
                    } else if (chosenIndex == 2) {
                      chosenIndex = -1;
                    } else {
                      changeNumberValue(index: 2, value: numbers[2]+numbers[chosenIndex]);
                      chosenIndex = -1;
                    }
                  });
                  print('Player 2: left hand clicked');
                },
                buttonText: numbers[2].toString(),
                backgroundColor: (chosenIndex == 2 ? Colors.red : Colors.white),
              ),
              PlayerButton(
                buttonPressed: () {
                  setState(() {
                    if (chosenIndex == -1) {
                      chosenIndex = 3;
                    } else if (chosenIndex == 3) {
                      chosenIndex = -1;
                    } else {
                      changeNumberValue(index: 3, value: numbers[3]+numbers[chosenIndex]);
                      chosenIndex = -1;
                    }
                  });
                  print('Player 2: right hand clicked');
                },
                buttonText: numbers[3].toString(),
                backgroundColor: (chosenIndex == 3 ? Colors.red : Colors.white),
              ),
            ],
          )
        ],
      ),
    );
  }
}


