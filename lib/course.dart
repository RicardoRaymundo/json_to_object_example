import 'package:json_to_object_example/lesson.dart';

class Course {
  String id;
  String title;
  String description;
  String author;
  String authorInfo;
  int year;
  List<Lesson> lessons;

  Course(Map<String, dynamic> data) {
    this._config(data);
  }

  void _config(Map<String, dynamic> data) {
    List<Lesson> listLesson = [];
    int len = data['lessons'].length;
    for (int i = 0; i < len; i++) {
      listLesson.add(Lesson.data(data['lessons'][i]));
    }

    this.id = data['id'] as String;
    this.title = data['title'] as String;
    this.description = data['description'] as String;
    this.author = data['author'] as String;
    this.authorInfo = data['author_info'] as String;
    this.year = data['year'] as int;
    this.lessons = listLesson;
  }

  factory Course.data(Map<String, dynamic> data) {
    return Course(data);
  }
}
