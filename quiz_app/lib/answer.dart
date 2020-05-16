import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function func;
  final String _answerText;
  Answer(this.func, this._answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: RaisedButton(
          onPressed: func,
          child: Text(_answerText),
          color: Colors.blueGrey,
        ));
  }
}
