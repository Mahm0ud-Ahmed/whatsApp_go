import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_whats_app/constant.dart';
import 'package:go_whats_app/data/local/country_model.dart';
import 'package:go_whats_app/data/local/repository/local_repository.dart';
import 'package:go_whats_app/data/local/storage_pref.dart';
import 'package:url_launcher/url_launcher.dart';

import 'country_state.dart';

class CountryCubit extends Cubit<GoWhatsAppState> {
  CountryCubit(this._repository) : super(CountryScreenInitial());

  static CountryCubit get(BuildContext context) => BlocProvider.of(context);

  final LocalRepository _repository;
  List<CountryModel> _allCountry = [];

  String selectedNewCountry;

  String number = '';
  String message = '';

  void getDataFromAssets() {
    _repository.getDataFromAssets().then((country) {
      if (country != null) {
        _allCountry = country;
        emit(CountryScreenSuccess(countries: country));
      }
    }).catchError((error) {
      print(error.toString());
      emit(CountryScreenError());
    });
  }

  void changeSelectedRadio(String newCountryCode) {
    // print(newCountryCode);
    selectedNewCountry = newCountryCode;
    emit(CountryScreenChangeRadio());
  }

  void setNumber(String newNumber) {
    number = newNumber;
    emit(HomeScreenNumberState());
  }

  Future<void> saveAllDataInStorage(String countryCode) async {
    final CountryModel country =
        _allCountry.firstWhere((element) => element.code == countryCode);
    try {
      if (country != null) {
        await StoragePref.setValue(code, country.code);
        await StoragePref.setValue(nameCountry, country.name);
        await StoragePref.setValue(dial, country.callingCode);
        emit(CountryScreenSuccessSaveData());
      }
    } on Exception catch (error) {
      print(error.toString());
      emit(CountryScreenErrorSaveData());
    }
  }

  void getAllDataFromStorage() {
    countryName = StoragePref.getValue(nameCountry);
    countryCode = StoragePref.getValue(code);
    countryDial = StoragePref.getValue(dial);
    emit(CountryScreenSuccessGetData());
  }

  void setMessage(String newMessage) {
    message = newMessage;
    emit(HomeScreenMessageState());
  }

  Future<bool> sendMessageToWhatsApp() async {
    bool result;
    if (number.isNotEmpty) {
      result = await launch(baseUrl +
          countryDial.toString() +
          number +
          queryMessageText +
          message);
    }
    return result;
  }

  Future<bool> chooseLanguage(String lang) async {
    return await StoragePref.setValue('current_lang', lang);
  }

  /*
  * ------------------------------
  * | * * * Search Feature * * * |                         
  * ------------------------------
  * */

  bool isSearch = false;
  String searchCountry = '';

  void changeSearchState() {
    isSearch = !isSearch;
    emit(SearchChangeState());
  }

  void setSearchCountry(String newCountry) {
    searchCountry = newCountry;
    addCountrySearchInList(_allCountry);
    // emit(SearchChangeState());
  }

  void addCountrySearchInList(List<CountryModel> country) {
    if (searchCountry.isNotEmpty) {
      final allCountrySearch = country.where((country) {
        if (country.name.toLowerCase().contains(searchCountry.toLowerCase()) ||
            country.callingCode.contains(searchCountry.toLowerCase())) {
          return true;
        } else {
          return false;
        }
      }).toList();
      emit(CountrySearchState(allCountrySearch));
    }
  }

  void clearSearchCharacter() {
    if (searchCountry.isNotEmpty) {
      searchCountry = '';
      emit(ClearCountrySearchState());
    }
  }
}
