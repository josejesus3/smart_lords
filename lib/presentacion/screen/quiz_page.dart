import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_lords/classes/question.dart';
import 'package:smart_lords/classes/quiz.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int totalQuestion = 5;
  int questionIndex = 0;
  int totalOptions = 4;
  int progresIndex = 0;
  Quiz quiz = Quiz(name: 'Quiz de Capitales', questions: []);
  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/json/paises.json');
    final List<dynamic> data = await jsonDecode(response);
    List<int> optionList = List<int>.generate(data.length, (i) => i);
    List<int> questionAdded = [];
    while (true) {
      optionList.shuffle();
      int answer = optionList[0];
      if (questionAdded.contains(answer)) continue;
      questionAdded.add(answer);
      List<String> otherOptions = [];
      for (var option in optionList.sublist(1, totalOptions)) {
        otherOptions.add(data[option]['capital']);
      }
      Question question = Question.fromJson(data[answer]);
      question.addOptions(otherOptions);
      quiz.questions.add(question);
      if (quiz.questions.length >= totalOptions) break;
    }
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readJson();
  }

  void _optionSelexted(String selected) {
    quiz.questions[questionIndex].selectd = selected;
    if (selected == quiz.questions[questionIndex].aswer) {
      quiz.questions[questionIndex].corret = true;
      quiz.right += 1;
    }
    progresIndex += 1;
    if (questionIndex < totalOptions - 1) {
      questionIndex += 1;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return Scaffold(
        backgroundColor: const Color(0xFFCEEBFF),
        appBar: AppBar(
          elevation: 4,
          title: Text(quiz.name),
          backgroundColor: const Color(0xFFCEEBFF),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: LinearProgressIndicator(
                  color: Colors.amber.shade600,
                  value: progresIndex / totalOptions,
                  minHeight: 20,
                ),
              ),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 430),
              child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
                  child: quiz.questions.isNotEmpty
                      ? Card(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                margin: const EdgeInsets.all(10),
                                child: Text(
                                  quiz.questions[questionIndex].question,
                                  style: textStyle.titleLarge,
                                ),
                              ),
                              Flexible(
                                child: ListView.builder(
                                  itemCount: totalOptions,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      margin: const EdgeInsets.all(12),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.indigo.shade100,
                                              width: 2),
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: ListTile(
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(15),
                                          ),
                                        ),
                                        leading: Text('${index + 1}'),
                                        title: Text(quiz
                                            .questions[questionIndex]
                                            .options[index]),
                                        onTap: () {
                                          _optionSelexted(quiz
                                              .questions[questionIndex]
                                              .options[index]);
                                        },
                                      ),
                                    );
                                  },
                                ),
                              )
                            ],
                          ),
                        )
                      : const CircularProgressIndicator()),
            ),
            TextButton(
                onPressed: () {
                  _optionSelexted('Skipped');
                },
                child: const Text('Skip'))
          ],
        ));
  }
}
