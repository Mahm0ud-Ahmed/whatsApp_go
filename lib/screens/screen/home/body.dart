import 'package:flutter/material.dart';
import 'package:go_whats_app/screens/screen/home/component/message_text_field.dart';
import 'package:go_whats_app/screens/screen/home/component/number_text_field.dart';

import 'component/send_button.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            NumberTextField(),
            SizedBox(
              height: 12,
            ),
            MessageTextField(),
            SizedBox(
              height: 32,
            ),
            SendButton(),
          ],
        ),
      ),
    );
  }
}
