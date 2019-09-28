class Lesson {

  String id;
  String title;
  String description;
  //List<dynamic> activities;
  //List<dynamic> placementTest;
  //List<dynamic> finalTest;

  Lesson({
    this.id,
    this.title,
    this.description,
    //this.activities,
    //this.placementTest,
    //this.finalTest
  });

  factory Lesson.data(Map<String, dynamic> data) {
    return Lesson(
      id: data['id'] as String,
      title: data['title'] as String,
      description: data['description'] as String,
      //activities: data['activities'] as List,
      //placementTest: data['placementTest'] as List,
      //finalTest: data['finalTest'] as List,
    );
  }
}