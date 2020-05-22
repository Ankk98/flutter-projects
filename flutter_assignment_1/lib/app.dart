import 'package:flutter/material.dart';
import './text_control.dart';

class App extends StatelessWidget {
  final String _textString;
  final Function _changeText;

  App(this._changeText, this._textString);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text(
            _textString,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 32,
            ),
          ),
          TextControl(_changeText),
        ],
      ),
      width: double.infinity,
    );
  }
}
