class Todo {
  String title;
  String note;

  Todo({
    required this.title,
    required this.note,
  });
  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      title: json['title'],
      note: json['note'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'note':note,
    };
  }
}
