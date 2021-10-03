import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:go_whats_app/constant.dart';
import 'package:go_whats_app/logic/cubit/country_cubit.dart';
import 'package:go_whats_app/screens/country/country_screen.dart';
import 'package:go_whats_app/screens/home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    CountryCubit.get(context).getAllDataFromStorage();
    super.initState();
    Widget nextScreen;
    if (countryDial != null) {
      nextScreen = HomeScreen();
    } else {
      nextScreen = const CountryScreen();
    }
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => nextScreen),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextLiquidFill(
          text: 'WhatsApp Go!',
          waveColor: Colors.green,
          boxBackgroundColor: Colors.grey.shade50,
          textAlign: TextAlign.center,
          textStyle: const TextStyle(
            letterSpacing: 3.0,
            fontSize: 50.0,
            fontWeight: FontWeight.bold,
          ),
          boxHeight: 300.0,
        ),
      ),
    );
  }
}
