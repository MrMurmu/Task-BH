
class TodoModel {
    final String task;
    bool isChecked;

    TodoModel({
        required this.task,
        this.isChecked = false,
    });

    factory TodoModel.fromMap(Map<String, dynamic> json) => TodoModel(
        task: json["task"],
        isChecked: json['isChecked'] ?? false,
    );

    Map<String, dynamic> toMap() => {
        "task": task,
        'isChecked': isChecked,
    };
}