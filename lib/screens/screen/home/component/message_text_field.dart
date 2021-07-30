import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_whats_app/logic/country_screen_logic/country_screen_cubit.dart';
import 'package:go_whats_app/shared/component/component.dart';
import 'package:go_whats_app/shared/data/repository/lang/app_local.dart';
import 'package:go_whats_app/shared/go_whats_app_state.dart';

class MessageTextField extends StatefulWidget {
  const MessageTextField({Key key}) : super(key: key);

  @override
  _MessageTextFieldState createState() => _MessageTextFieldState();
}

class _MessageTextFieldState extends State<MessageTextField> {
  final TextEditingController messageController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    messageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CountryScreenCubit, GoWhatsAppState>(
      listener: (context, state) {},
      builder: (context, state) {
        return customTextField(
            controller: messageController,
            label:
                AppLocal.getCurrentValueTranslate(context, 'textFieldMessage'),
            lines: 5,
            icon: const Icon(
              Icons.message,
              color: Colors.indigo,
              size: 32,
            ),
            keyboardType: TextInputType.text,
            onChange: (String message) {
              CountryScreenCubit.get(context).setMessage(message);
            });
      },
    );
  }
}
