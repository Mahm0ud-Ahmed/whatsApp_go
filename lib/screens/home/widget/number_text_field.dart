import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_whats_app/constant.dart';
import 'package:go_whats_app/core/app_localization.dart';
import 'package:go_whats_app/logic/cubit/country_cubit.dart';
import 'package:go_whats_app/screens/country/widget/custom_text_field.dart';

class NumberTextField extends StatefulWidget {
  const NumberTextField({Key key}) : super(key: key);

  @override
  _NumberTextFieldState createState() => _NumberTextFieldState();
}

class _NumberTextFieldState extends State<NumberTextField> {
  @override
  void initState() {
    CountryCubit.get(context).getAllDataFromStorage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          margin: const EdgeInsetsDirectional.only(end: 16),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            border: Border.all(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            '${generateCountryFlag(countryCode.toString())}  $countryDial',
            style: const TextStyle(
              height: 2.4,
              fontSize: 16,
            ),
          ),
        ),
        Expanded(
          child: CustomTextField(
            onChange: (String number) =>
                CountryCubit.get(context).setNumber(number),
            keyboard: TextInputType.number,
            lines: 1,
            fillColor: Colors.white,
            label: Text(
              AppLocal.getCurrentValueTranslate(context, 'textFieldNumber'),
            ),
            preIcon: const Padding(
              padding: EdgeInsetsDirectional.only(
                top: 12,
                start: 12,
              ),
              child: FaIcon(
                FontAwesomeIcons.whatsapp,
                color: Colors.green,
              ),
            ),
          ),
        ),
      ],
    );
  }

  String generateCountryFlag(String country) {
    return country.toUpperCase().replaceAllMapped(RegExp(r'[A-Z]'),
        (match) => String.fromCharCode(match.group(0).codeUnitAt(0) + 127397));
  }
}
