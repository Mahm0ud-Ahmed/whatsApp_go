import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_whats_app/constant.dart';
import 'package:go_whats_app/core/app_localization.dart';
import 'package:go_whats_app/data/local/repository/local_repository.dart';
import 'package:go_whats_app/data/local/storage_pref.dart';
import 'package:go_whats_app/screens/splash_screen/splash_screen.dart';
import 'logic/cubit/country_cubit.dart';
import 'observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StoragePref.getInstance();
  selectedLanguage = StoragePref.getValue('current_lang') as String ?? 'en';
  // StoragePref.clearStorage();
  final String dataFilePath = getCountryFilePath(selectedLanguage);
  Bloc.observer = MyBlocObserver();
  runApp(WhatsAppGo(dataFilePath));
}

class WhatsAppGo extends StatelessWidget {
  final String _countryFilePath;

  const WhatsAppGo(this._countryFilePath);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CountryCubit>(
      create: (context) =>
          CountryCubit(LocalRepository(path: _countryFilePath)),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SplashScreen(),
        localizationsDelegates: const [
          AppLocal.delegate,
          GlobalMaterialLocalizations.delegate,
          // GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', ''),
          Locale('ar', ''),
        ],
        locale: Locale(selectedLanguage, ''),
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

String getCountryFilePath(String lang) {
  String result;
  if (lang != null) {
    lang == 'en' ? result = englishFilePath : result = arabicFilePath;
    return result;
  } else {
    return result = englishFilePath;
  }
}
