import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({this.title, this.clickButton});

  final String title;
  final Function() clickButton;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: 100,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.teal,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
        onPressed: clickButton,
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
