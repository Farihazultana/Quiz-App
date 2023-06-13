import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Column(children: [
      Image.asset(
        'assets/images/quiz-logo.png',
        color: const Color.fromARGB(150, 255, 255, 255),
      ),

      //  Opacity(
      //   opacity: 0.6,
      //   child: Image.asset(
      //           'assets/images/quiz-logo.png',
      //           width: 300,
      //          ),
      //)

      const Padding(
        padding: EdgeInsets.only(top: 60),
      ),
      Text(
        'Learn Flutter the Fun way!',
        style: GoogleFonts.lato(fontSize: 24, color: Colors.white),
      ),
      const Padding(
        padding: EdgeInsets.only(top: 50),
      ),

      // const OutlinedButton(
      //     onPressed: null,
      //     child: Text(
      //       'Start Quiz',
      //       style: TextStyle(color: Colors.white),
      //     )),

      OutlinedButton.icon(
          onPressed: startQuiz,
          style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
          icon: const Icon(Icons.arrow_right_alt),
          label: const Text('Start Quiz'))
    ]);
  }
}
