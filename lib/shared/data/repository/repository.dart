import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:go_whats_app/shared/data/model/country_model.dart';

class Repository {
  List<CountryModel> allCountry = [];
  final String path;

  Repository({this.path});

  Future<List<CountryModel>> getDataFromAssets() async {
    final String response = await rootBundle.loadString(path);
    parseCountry(response.toString());
    // print(allCountry[0].name);
    return allCountry;
  }

  dynamic parseCountry(String responseBody) {
    if (responseBody.isNotEmpty) {
      final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
      return parsed.map<CountryModel>((json) {
        // CountryModel.fromJson(json);
        allCountry.add(CountryModel.fromJson(json));
      }).toList();
    }
    return [];
  }
}
