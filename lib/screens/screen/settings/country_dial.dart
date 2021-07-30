import 'package:flutter/material.dart';
import 'package:go_whats_app/screens/screen/country/country_screen.dart';
import 'package:go_whats_app/shared/data/repository/lang/app_local.dart';

class CountryDial extends StatelessWidget {
  const CountryDial({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
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
      ),
    );
  }
}
