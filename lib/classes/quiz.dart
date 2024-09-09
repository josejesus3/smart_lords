import 'package:smart_lords/classes/question.dart';

class Quiz {
  String name;
  List<Question> questions;
  int right = 0;
  Quiz({required this.name, required this.questions});
  double get percet => (right / questions.length) * 100;
}
