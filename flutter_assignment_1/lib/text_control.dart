import 'package:flutter/material.dart';

class TextControl extends StatelessWidget {
  final Function _changeText;
  TextControl(this._changeText);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        onPressed: _changeText,
        child: Text('Change Text'),
      ),
    );
  }
}
