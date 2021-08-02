import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_whats_app/logic/country_screen_logic/country_screen_cubit.dart';
import 'package:go_whats_app/shared/component/component.dart';
import 'package:go_whats_app/shared/component/constant.dart';
import 'package:go_whats_app/shared/data/repository/lang/app_local.dart';
import 'package:go_whats_app/shared/go_whats_app_state.dart';

class NumberTextField extends StatefulWidget {
  const NumberTextField({Key key}) : super(key: key);

  @override
  _NumberTextFieldState createState() => _NumberTextFieldState();
}

class _NumberTextFieldState extends State<NumberTextField> {
  TextEditingController numberController = TextEditingController();

  @override
  void initState() {
    CountryScreenCubit.get(context).getAllDataFromStorage();
    super.initState();
  }

  @override
  void dispose() {
    numberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CountryScreenCubit, GoWhatsAppState>(
      listener: (context, state) {},
      builder: (context, state) {
        return customTextField(
          controller: numberController,
          label: AppLocal.getCurrentValueTranslate(context, 'textFieldNumber'),
          preIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              '$countryCode | $countryDial',
              style: const TextStyle(height: 2.5),
            ),
          ),
          keyboardType: TextInputType.number,
          onChange: (String number) {
            CountryScreenCubit.get(context).setNumber(number);
          },
        );
      },
    );
  }
}
