import 'dart:ui';

import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int totalScore;
  final VoidCallback restartHandler;

  Result(this.totalScore, this.restartHandler);

  String get resultPhrase {
    String resultString;
    if (totalScore >= 30) {
      resultString = 'You are a God';
    } else if (totalScore >= 28) {
      resultString = 'You my duuud';
    } else if (totalScore >= 26) {
      resultString = 'Pwede na rin';
    } else if (totalScore >= 23) {
      resultString = 'Who tf are you?';
    } else {
      resultString = 'I dont know you lil bro';
    }
    return resultString;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 20),
            ),
            onPressed: restartHandler,
            child: const Text(
              'Restart Quiz',
            ),
          )
        ],
      ),
    );
  }
}
