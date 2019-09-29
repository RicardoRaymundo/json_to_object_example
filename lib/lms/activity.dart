
import 'package:json_to_object_example/lms/comprehension_test.dart';

class Activity {

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
  List<ComprehensionTest> comprehensionTest;

  Activity(Map<String, dynamic> data) {
    this._config(data);
  }



  void _config(Map<String, dynamic> data) {
    int lenComprehensionTest = data['comprehension_test'].length;

    // Converte o List<Map<String, dynamic> em uma List<ComprehensionTest>.
    final List<ComprehensionTest> listDataComprehensionTest = List.generate(lenComprehensionTest, (i) {
      return ComprehensionTest.generate(data['comprehension_test'][i]);
    });

    this.id = data['id'] as String;
    this.title = data['title'] as String;
    this.description = data['description'] as String;
    this.comprehensionTest = listDataComprehensionTest;
  }

  factory Activity.generate(Map<String, dynamic> data) {
    return Activity(data);
  }
}
