class ComprehensionTest {
  String id;
  String title;
  String correct;
  int score;

  ComprehensionTest(Map<String, dynamic> data) {
    this._config(data);
  }

  void _config(Map<String, dynamic> data) {
    this.id = data['id'] as String;
    this.title = data['title'] as String;
    this.correct = data['correct'] as String;
    this.score = data['score'] as int;
  }

  factory ComprehensionTest.generate(Map<String, dynamic> data) {
    return ComprehensionTest(data);
  }
}
