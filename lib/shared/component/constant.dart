import 'package:go_whats_app/shared/component/storage_pref.dart';

const String baseUrl = 'https://wa.me/';
const String queryMessageText = '?text=';

const String englishFilePath = 'assets/data/countries_en.json';
const String arabicFilePath = 'assets/data/countries_ar.json';

const String languageDataFilePath = 'assets/lang/';

const String code = 'code';
const String nameCountry = 'country';
const String dial = 'dial';

String appLanguage = '';
String appTheme = '';

dynamic countryDial = '';
dynamic countryName = '';
dynamic countryCode = '';

String selectedLanguage;

String getCountryFilePath(String lang) {
  String result;
  if (lang != null) {
    lang == 'en' ? result = englishFilePath : result = arabicFilePath;
    return result;
  } else {
    return result = englishFilePath;
  }
}
