import 'package:flutter/material.dart';

class HomeButton extends StatelessWidget {
  final String buttonText;
  final Color backgroundColor;
  final Function buttonPressed;

  const HomeButton(
      {@required this.buttonPressed, this.buttonText, this.backgroundColor, Key key})
      : assert(buttonPressed != null),
        assert(buttonText != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor,
      child: MaterialButton(
        onPressed: buttonPressed,
        height: 120.0,
        child: Text(
          buttonText,
          style: TextStyle(
            fontSize: 28.0,
          ),
        ),
      ),
    );
  }
}
