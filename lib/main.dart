import 'package:myquizapp/quiz.dart';
import 'package:flutter/material.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _score = 0;

  final questionList = [
    {
      "QuestionName": "What's your favourite colour ?",
      "AnswerList": [
        {"text": "Teal", "score": 10},
        {"text": "Green", "score": 20},
        {"text": "Black", "score": 30},
        {"text": "White", "score": 40}
      ]
    },
    {
      "QuestionName": "What's your favourite subject ?",
      "AnswerList": [
        {'text': 'Strategic Management', 'score': 10},
        {'text': 'Digital Economy', 'score': 20},
        {'text': 'Law', 'score': 30},
        {'text': 'Flutter', 'score': 40},
      ]
    },
    {
      "QuestionName": "What's your favourite season ?",
      "AnswerList": [
        {'text': 'Summer', 'score': 10},
        {'text': 'Spring', 'score': 20},
        {'text': 'Winter', 'score': 30},
        {'text': 'Fall', 'score': 40},
      ]
    },
  ];

  void resetData() {
    setState(() {
      _questionIndex = 0;
      _score = 0;
    });
  }

  void _answerQuestion(int score) {
    _score = _score + score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text(
          "Basic Quiz App",
          style: TextStyle(fontFamily: 'Inspiration'),
        ),
      ),
      body: _questionIndex < questionList.length
          ? Quiz(questionList, _questionIndex, _answerQuestion)
          : Result(_score, resetData),
    ));
  }
}
