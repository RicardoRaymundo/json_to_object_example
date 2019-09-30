import 'package:json_to_object_example/course/lesson/lesson_activity.dart';
import 'package:json_to_object_example/course/lesson/test/test_final.dart';
import 'package:json_to_object_example/course/lesson/test/test_placement.dart';

class Lesson {

  String id;
  String title;
  String description;
  List<LessonActivity> activities;
  List<TestPlacement> placementTest;
  List<TestFinal> finalTest;

  Lesson(Map<String, dynamic> data) {
    this._config(data);
  }

  void _config(Map<String, dynamic> data) {
    int lenActivities = data['activities'].length;
    int lenPlacementTest = data['placement_test'].length;
    int lenFinalTest = data['finalTest'].length;

    // Converte o List<Map<String, dynamic> em uma List<LessonActivity>.
    final List<LessonActivity> listDataActivity = List.generate(lenActivities, (i) {
      return LessonActivity.generate(data['activities'][i]);
    });

    // Converte o List<Map<String, dynamic> em uma List<TestPlacement>.
    final List<TestPlacement> listDataPlacementTest = List.generate(lenPlacementTest, (i) {
      return TestPlacement.generate(data['placement_test'][i]);
    });

    // Converte o List<Map<String, dynamic> em uma List<TestPlacement>.
    final List<TestFinal> listDataFinalTest = List.generate(lenFinalTest, (i) {
      return TestFinal.generate(data['finalTest'][i]);
    });

    this.id = data['id'] as String;
    this.title = data['title'] as String;
    this.description = data['description'] as String;
    this.activities = listDataActivity;
    this.placementTest = listDataPlacementTest;
    this.finalTest = listDataFinalTest;
  }

  factory Lesson.generate(Map<String, dynamic> data) {
    return Lesson(data);
  }
}