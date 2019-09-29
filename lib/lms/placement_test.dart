class PlacementTest {
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

  //ComprehensionTest comprehensionTest;

  PlacementTest(Map<String, dynamic> data) {
    this._config(data);
  }

  void _config(Map<String, dynamic> data) {
    this.id = data['id'] as String;
    this.title = data['title'] as String;
    this.description = data['description'] as String;
  }

  factory PlacementTest.generate(Map<String, dynamic> data) {
    return PlacementTest(data);
  }
}
