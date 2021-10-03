import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final Function(String country) onChange;
  final String hintText;
  final Color fillColor;
  final Widget label;
  final Widget preIcon;
  final int lines;
  final TextEditingController controller;
  final TextInputType keyboard;

  const CustomTextField(
      {Key key,
      this.onChange,
      this.hintText,
      this.fillColor,
      this.controller,
      this.label,
      this.keyboard,
      this.preIcon,
      this.lines})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
            color: Colors.grey,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            color: Colors.green.shade800,
          ),
        ),
        label: label,
        prefixIcon: preIcon,
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey.shade300),
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        filled: true,
        fillColor: fillColor,
      ),
      onChanged: onChange,
      keyboardType: keyboard,
      maxLines: lines,
      style: const TextStyle(color: Colors.black),
      cursorColor: Colors.orange,
      cursorHeight: 24,
    );
  }
}
