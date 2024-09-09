class Question {
  late String country;
  String question = 'Capital de: ';
  late String aswer;
  List<String> options = [];
  String selectd = 'Skiped';
  bool corret = false;
  Question.fromJson(Map<String, dynamic> json)
      : country = json['country'],
        aswer = json['capital'];

  void addOptions(List<String> newOptions) {
    question += '$country ';
    options.add(aswer);
    options.addAll(newOptions);
    options.shuffle();
  }
}
