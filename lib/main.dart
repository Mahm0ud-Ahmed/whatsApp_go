import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_whats_app/screens/screen/splash_screen/splash_screen.dart';
import 'package:go_whats_app/shared/component/constant.dart';
import 'package:go_whats_app/shared/component/storage_pref.dart';
import 'package:go_whats_app/shared/data/repository/lang/app_local.dart';
import 'package:go_whats_app/shared/data/repository/repository.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'logic/country_screen_logic/country_screen_cubit.dart';
import 'observer.dart';
import 'screens/screen/country/country_screen.dart';

// ignore: avoid_void_async
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StoragePref.getInstance();
  selectedLanguage = StoragePref.getValue('current_lang') as String;
  // StoragePref.removeValue('current_lang');
  print(selectedLanguage);
  final String dataFilePath = getCountryFilePath(selectedLanguage);
  Bloc.observer = MyBlocObserver();
  runApp(WhatsAppGo(dataFilePath));
}

class WhatsAppGo extends StatelessWidget {
  final String _countryFilePath;

  const WhatsAppGo(this._countryFilePath);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CountryScreenCubit>(
      create: (context) =>
          CountryScreenCubit(Repository(path: _countryFilePath))
            ..getAllDataFromStorage(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SplashScreen(),
        localizationsDelegates: const [
          AppLocal.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', ''),
          Locale('ar', ''),
        ],
        locale: Locale(selectedLanguage ?? 'en', ''),
/*        localeResolutionCallback: (currentLocal, supportedLocal) {
          if (currentLocal != null) {
            return AppLocal.extractRequiredLanguage(
                currentLocal, supportedLocal);
          }
          return supportedLocal.first;
        },*/
      ),
    );
  }
}
