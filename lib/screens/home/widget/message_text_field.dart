import 'package:flutter/material.dart';
import 'package:go_whats_app/core/app_localization.dart';
import 'package:go_whats_app/logic/cubit/country_cubit.dart';
import 'package:go_whats_app/screens/country/widget/custom_text_field.dart';

class MessageTextField extends StatefulWidget {
  const MessageTextField({Key key}) : super(key: key);

  @override
  _MessageTextFieldState createState() => _MessageTextFieldState();
}

class _MessageTextFieldState extends State<MessageTextField> {
  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      lines: 6,
      label:
          Text(AppLocal.getCurrentValueTranslate(context, 'textFieldMessage')),
      fillColor: Colors.white,
      onChange: (String message) =>
          CountryCubit.get(context).setMessage(message),
      preIcon: const Icon(
        Icons.message,
        color: Colors.indigo,
        size: 32,
      ),
    );
  }
}
