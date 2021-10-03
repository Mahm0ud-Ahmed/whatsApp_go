import 'package:flutter/material.dart';
import 'widget/message_text_field.dart';
import 'widget/number_text_field.dart';
import 'widget/send_button.dart';

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
            SizedBox(
              height: 32,
            ),
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
