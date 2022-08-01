import 'package:flutter/material.dart';
import 'package:flutter_basics/quiz.dart';

import './quiz.dart';
import './result.dart';
// import './question.dart';
// import './answer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;
  static const _questions = [
    {
      'questionText': 'What\'s your favorite word?',
      'answer': [
        {'text': 'Sheesh', 'score': 8},
        {'text': 'Godaaang', 'score': 7},
        {'text': 'Ratio', 'score': 8},
        {'text': 'Ohhwee', 'score': 10},
      ],
    },
    {
      'questionText': 'What\'s your favorite game?',
      'answer': [
        {'text': 'NBA2k', 'score': 10},
        {'text': 'GTAV', 'score': 10},
        {'text': 'Stray', 'score': 9},
        {'text': 'Crash Bandicoot', 'score': 8},
      ],
    },
    {
      'questionText': 'Who\'s your favorite NBA Player?',
      'answer': [
        {'text': 'Kobe', 'score': 10},
        {'text': 'Dirk', 'score': 9},
        {'text': 'DFS', 'score': 7},
        {'text': 'Luka', 'score': 10},
      ],
    },
  ];

  void _answerQuestion(int score) {
    _totalScore += score;
    print(_totalScore);
    setState(() {
      _questionIndex++;
    });

    print(_questionIndex);

    if (_questionIndex < _questions.length) {
      print("We have more questions");
    }
  }

  void _restartHandler() {
    setState(() {
      _totalScore = 0;
      _questionIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('How Del Rey are you'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _restartHandler),
      ),
    );
  }
}
