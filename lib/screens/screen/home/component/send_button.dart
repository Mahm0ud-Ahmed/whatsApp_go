import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_whats_app/logic/country_screen_logic/country_screen_cubit.dart';
import 'package:go_whats_app/shared/component/constant.dart';
import 'package:go_whats_app/shared/data/repository/lang/app_local.dart';
import 'package:go_whats_app/shared/go_whats_app_state.dart';
import 'package:url_launcher/url_launcher.dart';

class SendButton extends StatelessWidget {
  const SendButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String number;
    String message;
    return BlocConsumer<CountryScreenCubit, GoWhatsAppState>(
      listener: (context, state) {},
      builder: (context, state) {
        return MaterialButton(
          color: Colors.green.shade800,
          minWidth: 150,
          height: 54,
          onPressed: () async {
            number = CountryScreenCubit.get(context).number;
            message = CountryScreenCubit.get(context).message;
            if (number.isNotEmpty) {
              await launch(baseUrl +
                  countryDial.toString() +
                  number +
                  queryMessageText +
                  message);
            }
          },
          child: Text(
            AppLocal.getCurrentValueTranslate(context, 'sendButton'),
            style: const TextStyle(color: Colors.white, fontSize: 18),
          ),
        );
      },
    );
  }
}
