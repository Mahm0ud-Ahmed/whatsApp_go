import 'package:flutter/material.dart';
import 'package:go_whats_app/screens/screen/settings/body.dart';
import 'package:go_whats_app/shared/data/repository/lang/app_local.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            AppLocal.getCurrentValueTranslate(context, 'titleAppBarSetting')),
      ),
      body: const Body(),
    );
  }
}
