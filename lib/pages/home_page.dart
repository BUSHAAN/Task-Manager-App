// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:to_do_app/components/dialog_box.dart';
import 'package:to_do_app/components/to_do_tile.dart';
import 'package:to_do_app/data/database.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _tasksbox = Hive.box('tasks');

  final TextEditingController _taskController = TextEditingController();
  ToDoDatabase db = ToDoDatabase();

  @override
  void initState() {
    if (_tasksbox.get("TASKS") == null) {
      db.createInitialData();
      db.updateDataBase();
    } else {
      db.loadData();
    }
    super.initState();
  }

  void toggleCheckBox(bool? value, int index) {
    setState(() {
      db.tasks[index][1] = !db.tasks[index][1]!;
    });
    db.updateDataBase();
  }

  void saveNewTask() {
    setState(() {
      db.tasks.add([_taskController.text, false]);
      _taskController.clear();
      Navigator.of(context).pop();
    });
    db.updateDataBase();
  }

  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) => DialogBox(
              taskController: _taskController,
              onSave: saveNewTask,
              onCancel: () => Navigator.of(context).pop(),
            ));
  }

  void deleteTask(int index) {
    setState(() {
      db.tasks.removeAt(index);
    });
    db.updateDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Task Manager App', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add, color: Colors.white),
      ),
      body: ListView.builder(
          itemBuilder: (context, index) => ToDoTile(
                taskName: db.tasks[index][0],
                isCompleted: db.tasks[index][1],
                toggleCheckBox: (value) => toggleCheckBox(value, index),
                deleteTask: (context) => deleteTask(index),
              ),
          itemCount: db.tasks.length),
      backgroundColor: Colors.white70,
    );
  }
}
