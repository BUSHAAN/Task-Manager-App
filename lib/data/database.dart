import 'package:hive/hive.dart';

class ToDoDatabase {
  final _tasksbox = Hive.box('tasks');

  List tasks = [];

  //run this at the very first time the app runs
  void createInitialData() {
    tasks = [
      ["Do Exercise", false],
      ["Read a book", false],
      ["Buy groceries", false],
      ["Call mom", false],
    ];
  }

  void loadData() {
    tasks = _tasksbox.get("TASKS");
  }

  void updateDataBase() {
    _tasksbox.put("TASKS", tasks);
  }
}
