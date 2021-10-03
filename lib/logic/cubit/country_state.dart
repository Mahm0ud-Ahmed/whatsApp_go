import 'package:go_whats_app/data/local/country_model.dart';

abstract class GoWhatsAppState {}

class CountryScreenInitial extends GoWhatsAppState {}

class CountryScreenSuccess extends GoWhatsAppState {
  final List<CountryModel> countries;
  CountryScreenSuccess({this.countries});
}

class CountryScreenError extends GoWhatsAppState {}

class CountryScreenChangeRadio extends GoWhatsAppState {}

class HomeScreenNumberState extends GoWhatsAppState {}

class HomeScreenMessageState extends GoWhatsAppState {}

class CountryScreenSuccessSaveData extends GoWhatsAppState {}

class CountryScreenErrorSaveData extends GoWhatsAppState {}

class CountryScreenSuccessGetData extends GoWhatsAppState {}

class SearchChangeState extends GoWhatsAppState {}

class CountrySearchState extends GoWhatsAppState {
  final List<CountryModel> countriesSearch;
  CountrySearchState(this.countriesSearch);
}

class ClearCountrySearchState extends GoWhatsAppState {}
