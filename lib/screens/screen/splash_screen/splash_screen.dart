import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:go_whats_app/logic/country_screen_logic/country_screen_cubit.dart';
import 'package:go_whats_app/screens/screen/country/country_screen.dart';
import 'package:go_whats_app/screens/screen/home/home_screen.dart';
import 'package:go_whats_app/shared/component/constant.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    CountryScreenCubit.get(context).getAllDataFromStorage();
    super.initState();
    Widget nextScreen;
    if (countryDial != null) {
      // print(countryDial);
      nextScreen = HomeScreen();
    } else {
      nextScreen = const CountryScreen();
    }
    Timer(
      const Duration(seconds: 5),
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
