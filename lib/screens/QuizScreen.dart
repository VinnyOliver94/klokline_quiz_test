import 'package:flutter/material.dart';

import '../models/Questions.dart';
import 'ResultScreen.dart';

class QuizScreen extends StatefulWidget {
@override
_QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _questionIndex = 0;
  int _score = 0;

  final List<Map<String, Object>> _questions = [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1},
      ],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 3},
        {'text': 'Snake', 'score': 11},
        {'text': 'Elephant', 'score': 5},
        {'text': 'Lion', 'score': 9},
      ],
    },
    {
      'questionText': 'Who\'s your favorite instructor?',
      'answers': [
        {'text': 'Max', 'score': 1},
        {'text': 'Max', 'score': 1},
        {'text': 'Max', 'score': 1},
        {'text': 'Max', 'score': 1},
      ],
    },
  ];

  void _answerQuestion(int score) {
    _score += score;
    setState(() {
      _questionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _questionIndex < _questions.length
        ? Column(
      children: [
        Question(
          _questions[_questionIndex]['questionText'],
        ),
        ...(_questions[_questionIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(_answerQuestion, answer['score'], answer['text']);
        }).toList(),
      ],
    )
        : ResultScreen(_score);
  }
}