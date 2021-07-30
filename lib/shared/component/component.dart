import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget customTextField({
  @required TextEditingController controller,
  @required String label,
  String hintText,
  @required Icon icon,
  @required TextInputType keyboardType,
  int lines,
  Function(String value) onChange,
}) {
  return TextFormField(
    controller: controller,
    maxLines: lines ?? 1,
    decoration: InputDecoration(
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.green.shade700,
          width: 2,
        ),
      ),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey,
          width: 2,
        ),
      ),
      border: const OutlineInputBorder(
        borderSide: BorderSide(
          width: 2,
        ),
      ),
      hintText: hintText,
      labelText: label,
      prefixIcon: icon,
    ),
    keyboardType: keyboardType,
    onChanged: onChange,
  );
}
