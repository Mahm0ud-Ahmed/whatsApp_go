import 'package:flutter/material.dart';
import 'package:go_whats_app/core/app_localization.dart';
import 'package:go_whats_app/logic/cubit/country_cubit.dart';

class SendButton extends StatelessWidget {
  const SendButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 160,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.green,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
        onPressed: () async {
          await CountryCubit.get(context).sendMessageToWhatsApp();
        },
        child: Text(
          AppLocal.getCurrentValueTranslate(context, 'sendButton'),
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}
