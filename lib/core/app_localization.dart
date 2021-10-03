import 'package:flutter/material.dart';
import 'package:go_whats_app/constant.dart';
import 'package:go_whats_app/data/local/repository/local_repository.dart';
import 'package:go_whats_app/data/local/storage_pref.dart';

class AppLocal {
  final Locale currentLocalLanguage;

  AppLocal(this.currentLocalLanguage);

  final Map<String, String> _dataCurrentLanguage = {};

  static AppLocal get(BuildContext context) =>
      Localizations.of(context, AppLocal);

  void getLocalLanguageData() {
    LocalRepository().getLocalLanguageData(currentLocalLanguage).then((data) {
      _dataCurrentLanguage.addAll(data);
    });
  }

  static String getCurrentValueTranslate(BuildContext context, String key) {
    return AppLocal.get(context)._dataCurrentLanguage[key];
  }

  static Locale extractRequiredLanguage(
      Locale currentLocal, Iterable<Locale> supportedLocal) {
    Locale languageDevice;
    for (final Locale locale in supportedLocal) {
      if (locale.languageCode == currentLocal.languageCode) {
        final bool isStorage = _storageMyLanguage(currentLocal);
        if (isStorage) {
          languageDevice = currentLocal;
        }
      }
    }
    return languageDevice;
  }

  static bool _storageMyLanguage(Locale currentLocal) {
    bool isStorage = false;
    if (selectedLanguage == null) {
      StoragePref.setValue('current_lang', currentLocal.languageCode.toString())
          .then((value) => isStorage = value)
          .catchError((error) {
        print(error.toString());
      });
    }
    return isStorage;
  }

  static const LocalizationsDelegate<AppLocal> delegate = _AppLocalDelegate();
}

class _AppLocalDelegate extends LocalizationsDelegate<AppLocal> {
  const _AppLocalDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'ar'].contains(locale.languageCode);
  }

  @override
  Future<AppLocal> load(Locale locale) async {
    final AppLocal appLocal = AppLocal(locale);
    await appLocal.getLocalLanguageData();
    return appLocal;
  }

  @override
  bool shouldReload(_AppLocalDelegate old) => false;
}
