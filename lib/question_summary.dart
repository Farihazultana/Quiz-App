import 'package:flutter/material.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(Object context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
            children: summaryData.map((data) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 30,
                height: 30,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: data['user_answer'] == data['correct_answer']
                      ? const Color.fromARGB(255, 150, 198, 241)
                      : const Color.fromARGB(255, 249, 133, 241),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Text(
                  ((data['question_index'] as int) + 1).toString(),
                  style: const TextStyle(
                      color: Color.fromARGB(255, 22, 2, 56),
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data['question'] as String,
                      style: const TextStyle(
                          color: Color.fromARGB(255, 202, 171, 252)),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(data['user_answer'] as String,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 240, 130, 0),
                        )),
                    Text(data['correct_answer'] as String,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 181, 254, 246),
                        )),
                  ],
                ),
              )
            ],
          );
        }).toList()),
      ),
    );
  }
}
