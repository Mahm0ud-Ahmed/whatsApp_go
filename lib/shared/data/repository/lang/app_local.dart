import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_whats_app/shared/component/constant.dart';
import 'package:go_whats_app/shared/component/storage_pref.dart';

class AppLocal {
  final Locale localLanguage;

  AppLocal(this.localLanguage);

  Map<String, String> _dataCurrentLanguage = {};

  static AppLocal get(BuildContext context) =>
      Localizations.of(context, AppLocal);

  Future<Map<String, String>> processLocalLanguageData() async {
    final String response = await rootBundle
        .loadString('$languageDataFilePath${localLanguage.languageCode}.json');
    return _dataCurrentLanguage =
        _parseResponse(response) as Map<String, String>;
  }

  dynamic _parseResponse(String response) {
    if (response.isNotEmpty) {
      final Map<String, dynamic> _responseDecode =
          jsonDecode(response) as Map<String, dynamic>;
      return _responseDecode.map(
        (key, value) => MapEntry(key, value.toString()),
      );
    }
    return {};
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
    await appLocal.processLocalLanguageData();
    return appLocal;
  }

  @override
  bool shouldReload(_AppLocalDelegate old) => false;
}
