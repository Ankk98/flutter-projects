import 'package:flutter/material.dart';

class Done extends StatelessWidget {
  final int _resultScore;
  final Function _reset;
  Done(this._resultScore, this._reset);

  String get grade {
    var gradeText = 'End of the quiz, your score is ';
    gradeText += _resultScore.toString();
    gradeText += '.';
    if (_resultScore > 40) {
      gradeText += ' You Won! ';
    } else {
      gradeText += ' You Lost! ';
    }
    return gradeText;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Center(
          child: Text(grade),
        ),
        RaisedButton(
          onPressed: _reset,
          child: Text('Restart the Quiz'),
        ),
      ],
    );
  }
}
