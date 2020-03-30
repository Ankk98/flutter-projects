import 'package:flutter/material.dart';
import './quiz.dart';
import './done.dart';

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;

  var _questions = const [
    {
      'questionText': 'Your age group?',
      'answers': [
        {'text': '0-18', 'score': 10},
        {'text': '18-30', 'score': 20},
        {'text': '30-60', 'score': 30},
        {'text': 'Above 60', 'score': -10},
      ],
    },
    {
      'questionText': 'Your country?',
      'answers': [
        {'text': 'India', 'score': 50},
        {'text': 'US', 'score': 10},
        {'text': 'China', 'score': 10},
        {'text': 'Japan', 'score': 20},
      ],
    },
    {
      'questionText': 'Your fav actor?',
      'answers': [
        {'text': 'Hritik', 'score': 10},
        {'text': 'Nawaz', 'score': 10},
        {'text': 'Rajkumar', 'score': 10},
        {'text': 'Aamir', 'score': 10},
      ],
    },
    {
      'questionText': 'Your fav sport',
      'answers': [
        {'text': 'Soccer', 'score': 10},
        {'text': 'Cricket', 'score': 10},
        {'text': 'Badminton', 'score': 10},
        {'text': 'Basketball', 'score': 10},
      ],
    }
  ];

  void _reset(){
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
    print('restarted');
  }

  void _answerFunction(int score) {
    setState(() {
      _questionIndex += 1;
    });
    _totalScore += score;
    print('Button pressed!' + score.toString());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('My Quiz App'),
      ),
      body: _questionIndex < _questions.length
          ? Quiz(
              questionIndex: _questionIndex,
              answerFunction: _answerFunction,
              questions: _questions,
            )
          : Done(_totalScore, _reset),
    ));
  }
}

void main() => runApp(MyApp());

// Extras:
// body: Text('body'),
// void main()
// {
//     runApp(MyApp());
// }
// RaisedButton(
//   onPressed: _answer1,
//   child: Text('answer 1'),
// ),
// RaisedButton(
//   onPressed: () => print('ans 2'),
//   child: Text('answer 2'),
// ),
// RaisedButton(
//   onPressed: () {
//     // anonymous function
//     print('answer 3');
//   },
//   child: Text('answer 3'),
// ),
// RaisedButton(
//   onPressed: null,
//   child: Text('answer 4'),
// // ),
// Answer(_answer1, _questions[_questionIndex]['_answers']),
//           Answer(_answer2, _questions[_questionIndex]['_answers'][1]),
//           Answer(_answer3, _questions[_questionIndex]['_answers'][2]),
//           Answer(_answer4, _questions[_questionIndex]['_answers'][3]),
// questions.map(),
// Answer(_answer1, (questions[_questionIndex]['_answers'] as List<String>)[0]),
// return MaterialApp(home: Text('kailash app'));

// void _answer2() {
//   setState(() {
//     _questionIndex += 1;
//   });
//   print('answer 2 pressed!');
// }

// void _answer3() {
//   setState(() {
//     _questionIndex += 1;
//   });
//   print('answer 3 pressed!');
// }

// void _answer4() {
//   setState(() {
//     _questionIndex += 1;
//   });
//   print('answer 4 pressed!');
// }
