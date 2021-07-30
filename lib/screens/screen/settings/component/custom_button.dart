import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({this.title, this.clickButton, this.colorButton});
  final String title;
  final Function clickButton;
  final Color colorButton;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        clickButton();
      },
      color: colorButton ?? Colors.teal,
      child: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
