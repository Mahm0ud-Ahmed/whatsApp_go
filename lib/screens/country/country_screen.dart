import 'package:flutter/material.dart';
import 'package:go_whats_app/screens/country/body.dart';

import 'widget/search_bar.dart';

class CountryScreen extends StatefulWidget {
  const CountryScreen({Key key}) : super(key: key);

  @override
  _CountryScreenState createState() => _CountryScreenState();
}

class _CountryScreenState extends State<CountryScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 60),
        child: SearchBar(),
      ),
      body: Body(),
    );
  }
}
