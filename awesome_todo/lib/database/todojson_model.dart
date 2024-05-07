import 'dart:convert';

ToDo toDoFromJson(String str) => ToDo.fromJson(json.decode(str));

String toDoToJson(ToDo data) => json.encode(data.toJson());

class ToDo {
  final int? todoId;
  final String title;
  final String content;
  final bool isCompleted;

  ToDo({
    this.todoId,
    required this.title,
    required this.content,
    required this.isCompleted,
  });

  ToDo copyWith({
    int? todoId,
    String? title,
    String? content,
    bool? isCompleted,
  }) =>
      ToDo(
        todoId: todoId ?? this.todoId,
        title: title ?? this.title,
        content: content ?? this.content,
        isCompleted: isCompleted ?? this.isCompleted,
      );

  factory ToDo.fromJson(Map<String, dynamic> json) => ToDo(
        todoId: json["todoId"],
        title: json["title"],
        content: json["content"],
        isCompleted: json["isCompleted"] == 1,
      );

  Map<String, dynamic> toJson() => {
        "todoId": todoId,
        "title": title,
        "content": content,
        "isCompleted": isCompleted,
      };
}
