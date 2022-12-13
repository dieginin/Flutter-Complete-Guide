import 'package:flutter/material.dart';

import 'package:quiz_app/widgets/widgets.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  void _answerQuestion() {
    print('Answer chosen.');
    setState(() => _questionIndex++);
  }

  @override
  Widget build(BuildContext context) {
    const questions = [
      {
        'questionText': 'What\'s your favorite color?',
        'answers': ['Black', 'Red', 'Green', 'White', 'Blue']
      },
      {
        'questionText': 'What\'s your favorite animal?',
        'answers': ['Rabbit', 'Snake', 'Elephant', 'Tiger', 'Dog', 'Cat']
      },
      {
        'questionText': 'Who\'s your favorite instructor?',
        'answers': ['Max', 'Max']
      },
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('My First App')),
        body: Column(
          children: [
            Question(questions[_questionIndex]['questionText'] as String),
            ...(questions[_questionIndex]['answers'] as List<String>).map(
              (answer) => Answer(_answerQuestion, answer),
            ),
          ],
        ),
      ),
    );
  }
}
