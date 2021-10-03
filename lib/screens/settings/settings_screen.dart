import 'package:flutter/material.dart';
import 'package:go_whats_app/core/app_localization.dart';
import 'package:go_whats_app/screens/settings/body.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocal.getCurrentValueTranslate(context, 'titleAppBarSetting'),
        ),
      ),
      body: const Body(),
    );
  }
}
