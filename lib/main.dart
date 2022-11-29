import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() => runApp(const QuizApp());

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return _QuizAppState();
  }
}

class _QuizAppState extends State<QuizApp> {
  var _questionIndex = 0;
  var _totalScore = 0;
  final _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Blue', 'score': 2},
        {'text': 'White', 'score': 1},
      ],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Dog', 'score': 1},
        {'text': 'Snake', 'score': 9},
        {'text': 'Cat', 'score': 3},
        {'text': 'Shark', 'score': 7},
      ],
    },
    {
      'questionText': 'What\'s your favorite city?',
      'answers': [
        {'text': 'Porto', 'score': 1},
        {'text': 'Barcelona', 'score': 3},
        {'text': 'London', 'score': 4},
        {'text': 'Florence', 'score': 2},
      ],
    },
  ];

  void _answerQuestion(int score) {
    if (hasQuestion) {
      setState(() {
        _questionIndex++;
        _totalScore += score;
      });
    }
  }

  bool get hasQuestion {
    return _questionIndex < _questions.length;
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Quiz App'),
        ),
        body: SingleChildScrollView(
          child: hasQuestion
              ? Quiz(
                  answerQuestion: _answerQuestion,
                  questionIndex: _questionIndex,
                  questions: _questions,
                )
              : Result(_totalScore, _resetQuiz),
        ),
      ),
    );
  }
}
