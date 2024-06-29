// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool isCompleted;
  Function(bool?)? toggleCheckBox;
  Function(BuildContext)? deleteTask;

  ToDoTile(
      {super.key,
      required this.taskName,
      required this.isCompleted,
      required this.toggleCheckBox,
      required this.deleteTask});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, top: 8, right: 8),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteTask,
              icon: Icons.delete,
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.circular(8),
            )
          ],
        ),
        child: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(8)),
            padding: EdgeInsets.only(top: 1, left: 8),
            
            child: ListTile(
              title: Text(
                taskName,
                style: TextStyle(
                    decoration: isCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),
              trailing: Checkbox(
                value: isCompleted,
                onChanged: toggleCheckBox,
              ),
            )),
      ),
    );
  }
}
