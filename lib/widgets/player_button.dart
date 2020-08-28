import 'package:flutter/material.dart';

class PlayerButton extends StatelessWidget {
  final Function buttonPressed;
  final String buttonText;
  final Color backgroundColor;

  const PlayerButton(
      {@required this.buttonPressed, this.buttonText, this.backgroundColor, Key key})
      : assert(buttonPressed != null),
        assert(buttonText != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Material(
        elevation: 5.0,
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10.0),
        child: MaterialButton(
          onPressed: buttonPressed,
          height: 100.0,
          minWidth: 100.0,
          child: Text(
            buttonText,
            style: TextStyle(
              fontSize: 40.0,
            ),
          ),
        ),
      ),
    );
  }
}
