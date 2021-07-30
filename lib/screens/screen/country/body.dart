import 'package:flutter/material.dart';
import 'package:go_whats_app/screens/screen/country/component/country_list.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      child: Column(
        children: const <Widget>[
          CountryList(),
        ],
      ),
    );
  }
}
