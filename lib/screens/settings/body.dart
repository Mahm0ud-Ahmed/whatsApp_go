import 'package:flutter/material.dart';

import 'change_country.dart';
import 'language_item.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const ChangeCountry(),
        buildDivider(),
        const SizedBox(
          height: 14,
        ),
        const LanguageItem(),
        const SizedBox(
          height: 14,
        ),
        buildDivider(),
        const SizedBox(
          height: 14,
        ),
      ],
    );
  }

  Widget buildDivider() {
    return Divider(
      height: 0.5,
      color: Colors.grey.shade700,
    );
  }
}
