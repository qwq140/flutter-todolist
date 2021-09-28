class Task {
  final int? id;
  final String? title;
  final String? content;
  final bool? completed;

  Task({this.id, this.title, this.content, this.completed});

  Task.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        title = json["title"],
        content = json["content"],
        completed = json["completed"];
}
