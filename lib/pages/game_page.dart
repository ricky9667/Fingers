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
                  print('Player 1: right hand clicked');
                },
                buttonText: '1',
                backgroundColor: Colors.white,
              ),
              PlayerButton(
                buttonPressed: () {
                  print('Player 1: left hand clicked');
                },
                buttonText: '1',
                backgroundColor: Colors.white,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              PlayerButton(
                buttonPressed: () {
                  print('Player 2: left hand clicked');
                },
                buttonText: '1',
                backgroundColor: Colors.white,
              ),
              PlayerButton(
                buttonPressed: () {
                  print('Player 2: right hand clicked');
                },
                buttonText: '1',
                backgroundColor: Colors.white,
              ),
            ],
          )
        ],
      ),
    );
  }
}
