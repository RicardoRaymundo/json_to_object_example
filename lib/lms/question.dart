import 'answers.dart';

class Question {
  String id;
  String title;
  String correct;
  int score;
  Answers answers;

  Question({
    this.id,
    this.title,
    this.correct,
    this.score,
    this.answers,
  });
}
