import 'package:flutter/material.dart';
import 'package:go_whats_app/core/app_localization.dart';
import 'package:go_whats_app/screens/country/country_screen.dart';

class ChangeCountry extends StatelessWidget {
  const ChangeCountry({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        AppLocal.getCurrentValueTranslate(context, 'changeCountrySetting'),
        style: Theme.of(context).textTheme.headline6.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.normal,
            ),
      ),
      onTap: () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) {
            return const CountryScreen();
          }),
        );
      },
    );
  }
}
