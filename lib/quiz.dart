import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/question_screen.dart';
import 'package:quiz_app/results_screen.dart';
import 'package:quiz_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  //Widget? activeScreen;

  // @override
  // void initState() {
  //   activeScreen = StartScreen(swichScreen);
  //   super.initState();
  // }

  List<String> selectedAnswer = [];
  var activeScreen = 'start-screen';

  void swichScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswer.add(answer);
    setState(() {
      if (selectedAnswer.length == questions.length) {
        //selectedAnswer = [];

        activeScreen = 'result-screen';
      }
    });
  }

  void restartQuiz() {
    setState(() {
      selectedAnswer = [];
      activeScreen = 'start-screen';
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(swichScreen);

    if (activeScreen == 'questions-screen') {
      setState(() {
        screenWidget = QuestionScreen(onSelectAnswer: chooseAnswer);
      });
    }

    if (activeScreen == 'result-screen') {
      setState(() {
        screenWidget = ResultsScreen(
          choosenAnswers: selectedAnswer,
          onRestart: restartQuiz,
        );
      });
    }

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 78, 13, 151),
              Color.fromARGB(255, 107, 15, 168)
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
          child: screenWidget,
        )));
  }
}
