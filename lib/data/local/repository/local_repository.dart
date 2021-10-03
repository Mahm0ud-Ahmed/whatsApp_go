import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_whats_app/data/local/country_model.dart';
import '../../../constant.dart';

class LocalRepository {
  final String path;
  LocalRepository({this.path});

  Future<List<CountryModel>> getDataFromAssets() async {
    final String response = await rootBundle.loadString(path);
    return parseCountry(response.toString());
  }

  List<CountryModel> parseCountry(String responseBody) {
    if (responseBody.isNotEmpty) {
      final List parsed = jsonDecode(responseBody) as List;
      return parsed.map<CountryModel>((json) {
        return CountryModel.fromJson(json);
      }).toList();
    }
    return [];
  }

  Future<Map<String, String>> getLocalLanguageData(
      Locale currentLocalLanguage) async {
    final String response = await rootBundle.loadString(
        '$languageDataFilePath${currentLocalLanguage.languageCode}.json');
    return _parseResponse(response) as Map<String, String>;
  }

  dynamic _parseResponse(String response) {
    if (response.isNotEmpty) {
      final Map<String, dynamic> responseDecode =
          jsonDecode(response) as Map<String, dynamic>;
      return responseDecode.map(
        (key, value) => MapEntry(key, value.toString()),
      );
    }
    return {};
  }
}
