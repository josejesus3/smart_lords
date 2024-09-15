import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_lords/classes/question.dart';
import 'package:smart_lords/classes/quiz.dart';

class ReviewPages extends StatefulWidget {
  const ReviewPages({super.key});

  @override
  State<ReviewPages> createState() => _ReviewPagesState();
}

class _ReviewPagesState extends State<ReviewPages> {
  Quiz quiz = Quiz(name: 'Quiz de Capitales', questions: []);
  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/json/paises.json');
    final List<dynamic> data = await jsonDecode(response);
    for (var item in data) {
      Question question = Question.fromJson(item);
      question.question += question.country;
      quiz.questions.add(question);
    }
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFCEEBFF),
        appBar: AppBar(
          backgroundColor: const Color(0xFFCEEBFF),
          elevation: 0,
        ),
        body: quiz.questions.isNotEmpty
            ? Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.only(
                        left: 8, right: 8, top: 2, bottom: 10),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border:
                          Border.all(color: Colors.indigo.shade50, width: 1),
                    ),
                    child: Center(
                      child: Text('Preguntas: ${quiz.questions.length}'),
                    ),
                  ),
                  Expanded(
                      child: ListView.builder(
                    itemCount: quiz.questions.length,
                    itemBuilder: (context, index) {
                      return Card(
                        color: Colors.white,
                        child: ListTile(
                          leading: Text('${index + 1}'),
                          title: Text(quiz.questions[index].question),
                          trailing: Text(quiz.questions[index].aswer),
                        ),
                      );
                    },
                  ))
                ],
              )
            : const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ));
  }
}
