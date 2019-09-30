import 'package:json_to_object_example/course_tree/answers.dart';

class ComprehensionTest {
  String id;
  String title;
  String correct;
  int score;
  List<Answers> answers;

  ComprehensionTest(Map<String, dynamic> data) {
    this._config(data);
  }

  void _config(Map<String, dynamic> data) {
    int lenAnswers = data['answers'].length;

    // Converte o List<Map<String, dynamic> em uma List<ComprehensionTest>.
    final List<Answers> listDataAnswers = List.generate(lenAnswers, (i) {
      return Answers.generate(data['answers'][i]);
    });

    this.id = data['id'] as String;
    this.title = data['title'] as String;
    this.correct = data['correct'] as String;
    this.score = data['score'] as int;
    this.answers = listDataAnswers;
  }

  factory ComprehensionTest.generate(Map<String, dynamic> data) {
    return ComprehensionTest(data);
  }
}
