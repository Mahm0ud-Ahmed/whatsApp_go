import 'package:flutter/material.dart';
import 'package:go_whats_app/screens/screen/home/body.dart';
import 'package:go_whats_app/screens/screen/settings/settings_screen.dart';
import 'package:go_whats_app/shared/data/model/country_model.dart';

class HomeScreen extends StatelessWidget {
  final CountryModel countryModel;

  const HomeScreen(this.countryModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WhatsApp Go'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const SettingsScreen()),
              );
            },
          ),
        ],
      ),
      body: const Body(),
    );
  }
}
