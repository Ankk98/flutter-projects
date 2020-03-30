import 'package:flutter/material.dart';
import './app.dart';

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _textString = 'Lorem ipsum';
  void _changeText() {
    setState(() {
      if (_textString == 'Lorem ipsum')
        _textString = 'new text';
      else
        _textString = 'Lorem ipsum';
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Assignment 1'),
        ),
        body: App(_changeText, _textString),
      ),
    );
  }
}

void main() => runApp(MyApp());

// 1) Create a new Flutter App (in this project) and output an AppBar and some text
// below it
// 2) Add a button which changes the text (to any other text of your choice)
// 3) Split the app into three widgets: App, TextControl & Text
