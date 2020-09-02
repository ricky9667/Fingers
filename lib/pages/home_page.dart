import 'package:fingers/widgets/home_button.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fingers'),
        centerTitle: true,
        backgroundColor: Colors.grey[800],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          HomeButton(
            buttonPressed: () {
              Navigator.pushNamed(context, '/game');
            },
            buttonText: 'Play',
            backgroundColor: Colors.lightBlue,
          ),
          HomeButton(
            buttonPressed: () {
              Navigator.pushNamed(context, '/settings');
            },
            buttonText: 'Settings',
            backgroundColor: Colors.amberAccent,
          ),
          HomeButton(
            buttonPressed: () {
              Navigator.pushNamed(context, '/about');
            },
            buttonText: 'About',
            backgroundColor: Colors.redAccent,
          ),
        ],
      ),
      backgroundColor: Colors.grey[600],
    );
  }
}
