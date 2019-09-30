import 'alternative.dart';

class Answers {
  String id;
  String title;

  Answers(Map<String, dynamic> data) {
    this._config(data);
  }

  void _config(Map<String, dynamic> data) {

    this.id = data['id'] as String;
    this.title = data['title'] as String;
  }

  factory Answers.generate(Map<String, dynamic> data) {
    return Answers(data);
  }
}