import 'package:json_to_object_example/course_tree/activity.dart';
import 'package:json_to_object_example/course_tree/final_test.dart';
import 'package:json_to_object_example/course_tree/placement_test.dart';

class Lesson {

  String id;
  String title;
  String description;
  List<Activity> activities;
  List<PlacementTest> placementTest;
  List<FinalTest> finalTest;

  Lesson(Map<String, dynamic> data) {
    this._config(data);
  }

  void _config(Map<String, dynamic> data) {
    int lenActivities = data['activities'].length;
    int lenPlacementTest = data['placement_test'].length;
    int lenFinalTest = data['finalTest'].length;

    // Converte o List<Map<String, dynamic> em uma List<Activity>.
    final List<Activity> listDataActivity = List.generate(lenActivities, (i) {
      return Activity.generate(data['activities'][i]);
    });

    // Converte o List<Map<String, dynamic> em uma List<PlacementTest>.
    final List<PlacementTest> listDataPlacementTest = List.generate(lenPlacementTest, (i) {
      return PlacementTest.generate(data['placement_test'][i]);
    });

    // Converte o List<Map<String, dynamic> em uma List<PlacementTest>.
    final List<FinalTest> listDataFinalTest = List.generate(lenFinalTest, (i) {
      return FinalTest.generate(data['finalTest'][i]);
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