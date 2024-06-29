// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:to_do_app/components/my_button.dart';

class DialogBox extends StatelessWidget {
  final TextEditingController taskController;
  VoidCallback onCancel;
  VoidCallback onSave;
  DialogBox({super.key, required this.taskController, required this.onCancel, required this.onSave});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        content: Container(
      height: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Enter new task",
            style: TextStyle(fontSize: 18),
          ),
          TextField(
            controller: taskController,
            decoration: InputDecoration(
                hintText: "Task Name", border: OutlineInputBorder()),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MyButton(buttonText: "Cancel", onPressed: onCancel),
              MyButton(
                buttonText: "Save",
                onPressed: onSave,
              ),
            ],
          )
        ],
      ),
    ));
  }
}
