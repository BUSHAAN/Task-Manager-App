// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String buttonText;
  VoidCallback? onPressed;
  MyButton({super.key, required this.buttonText,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.blue),
        ),
        onPressed: onPressed,
        child: Text(
          buttonText,
          style: TextStyle(color: Colors.white),
        ));
  }
}
