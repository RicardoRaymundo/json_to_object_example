import 'package:json_to_object_example/course/lesson/test/test_comprehension.dart';

class LessonActivity {
  String id;
  int index;
  String title;
  String description;
  int number;
  int part;
  String youtube;
  String image;
  String duration;
  int likeUp;
  int likeDown;
  List<TestComprehension> comprehensionTest;

  LessonActivity(Map<String, dynamic> data) {
    this._config(data);
  }

  void _config(Map<String, dynamic> data) {
    int lenComprehensionTest = data['comprehension_test'].length;

    // Converte o List<Map<String, dynamic> em uma List<TestComprehension>.
    final List<TestComprehension> listDataComprehensionTest = List.generate(lenComprehensionTest, (i) {
      return TestComprehension.generate(data['comprehension_test'][i]);
    });

    this.id = data['id'] as String;
    this.title = data['title'] as String;
    this.description = data['description'] as String;
    this.comprehensionTest = listDataComprehensionTest;
  }

  factory LessonActivity.generate(Map<String, dynamic> data) {
    return LessonActivity(data);
  }
}
