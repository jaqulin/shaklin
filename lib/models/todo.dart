import 'task.dart';

class Todo {
  String title;
  List<Task> task;

  int get percentage {
    int total = 0;
    for (int i = 0; i < task.length; i++) {
      if (task[i].completed == true) {
        total = total + 1;
      }
    }

    return ((total / task.length) * 100).toInt();
  }

  Todo({required this.title, required this.task});
  Todo.copy(Todo from)
      : this(
            title: from.title,
            task: [for (Task _task in from.task) Task.copy(_task)]);
  update(Todo ta) {
    // ignore: unnecessary_this
    this.title = ta.title;
    // ignore: unnecessary_this
    this.task = ta.task;
    percentage;
  }
}
