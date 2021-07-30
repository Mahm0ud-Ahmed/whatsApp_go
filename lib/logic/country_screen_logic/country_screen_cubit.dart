import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_whats_app/logic/country_screen_logic/country_screen_state.dart';
import 'package:go_whats_app/shared/component/constant.dart';
import 'package:go_whats_app/shared/component/storage_pref.dart';
import 'package:go_whats_app/shared/data/model/country_model.dart';
import 'package:go_whats_app/shared/data/repository/repository.dart';
import 'package:go_whats_app/shared/go_whats_app_state.dart';

class CountryScreenCubit extends Cubit<GoWhatsAppState> {
  CountryScreenCubit(this.repository) : super(CountryScreenInitial());

  static CountryScreenCubit get(BuildContext context) =>
      BlocProvider.of(context);

  List<CountryModel> allCountry = [];
  Repository repository;
  CountryModel country;

  String number = '';
  String message = '';

  bool isSearch = true;
  String searchCharacter = '';
  List<CountryModel> allCountrySearch = [];

  void getDataFromAssets() {
    repository.getDataFromAssets().then((country) {
      if (country != null) {
        allCountry = country;
        emit(CountryScreenSuccess());
      }
    }).catchError((error) {
      print(error.toString());
      emit(CountryScreenError());
    });
  }

  void changeSelectedRadio(CountryModel countrySelected) {
    country = countrySelected;
    emit(CountryScreenChangeRadio());
  }

  void setNumber(String newNumber) {
    number = newNumber;
    emit(HomeScreenNumberState());
  }

  Future<bool> saveAllDataInStorage() async {
    try {
      if (country != null) {
        await StoragePref.setValue(code, country.code);
        await StoragePref.setValue(nameCountry, country.name);
        await StoragePref.setValue(dial, country.callingCode);
        emit(CountryScreenSuccessSaveData());
        return true;
      }
    } on Exception catch (error) {
      print(error.toString());
      emit(CountryScreenErrorSaveData());
    }
    return false;
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

  void changeSearchState() {
    isSearch = !isSearch;
    print(isSearch);
    emit(SearchChangeState());
  }

  void setSearchCharacter(String newCharacter) {
    searchCharacter = newCharacter;
    emit(SearchChangeState());
  }

  void addCountrySearchInList() {
    if (searchCharacter.isNotEmpty) {
      allCountrySearch = allCountry.where((country) {
        if (country.name
                .toLowerCase()
                .contains(searchCharacter.toLowerCase()) ||
            country.callingCode.contains(searchCharacter.toLowerCase())) {
          return true;
        } else {
          return false;
        }
        // return country.name.toLowerCase().startsWith(searchCharacter);
      }).toList();
      emit(CharacterSearchState());
    }
  }

  void clearSearchCharacter() {
    if (searchCharacter.isNotEmpty) {
      searchCharacter = '';
      emit(ClearCharacterSearchState());
    }
  }
}
