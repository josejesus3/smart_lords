import 'package:flutter/material.dart';
import 'package:smart_lords/classes/quiz.dart';

class ResultPage extends StatelessWidget {
  final Quiz quiz;
  const ResultPage({super.key, required this.quiz});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFCEEBFF),
      appBar: AppBar(
        title: Text(quiz.name),
        backgroundColor: const Color(0xFFCEEBFF),
        elevation: 0,
      ),
      body: Center(
        child: Column(
          children: [
            Text('Preguntas: ${quiz.questions.length}'),
            Text('Preguntas: ${quiz.percet}%'),
            Container(
              padding: const EdgeInsets.only(left: 40),
              margin:
                  const EdgeInsets.only(left: 2, right: 2, top: 2, bottom: 10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.indigo.shade50, width: 1),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: quiz.questions.length,
                      itemBuilder: (context, index) {
                        return Card(
                          color: quiz.questions[index].corret
                              ? Colors.green.shade200
                              : Colors.red.shade200,
                          child: ListTile(
                            leading: quiz.questions[index].corret
                                ? Icon(
                                    Icons.check,
                                    //color: Colors.green.shade900,
                                  )
                                : Icon(
                                    Icons.close,
                                    //color: Colors.red.shade900,
                                  ),
                            title: Text(quiz.questions[index].question),
                            subtitle: Text(quiz.questions[index].selectd),
                            trailing: Text(
                              quiz.questions[index].aswer,
                              style: TextStyle(color: Colors.green.shade900),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
