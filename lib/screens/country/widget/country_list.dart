import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_whats_app/data/local/country_model.dart';
import 'package:go_whats_app/logic/cubit/country_cubit.dart';
import 'package:go_whats_app/logic/cubit/country_state.dart';
import 'package:go_whats_app/screens/country/widget/build_country_item.dart';
import 'package:go_whats_app/screens/home/home_screen.dart';

class CountryList extends StatefulWidget {
  const CountryList({Key key}) : super(key: key);

  @override
  _CountryListState createState() => _CountryListState();
}

class _CountryListState extends State<CountryList> {
  CountryCubit _countryCubit;
  List<CountryModel> _allCountry = [];
  List<CountryModel> _countrySearch = [];
  String selectedNewCountry = '';

  @override
  void initState() {
    _countryCubit = CountryCubit.get(context)..getDataFromAssets();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CountryCubit, GoWhatsAppState>(
      listener: (context, state) {
        if (state is CountryScreenSuccess) {
          _allCountry = state.countries;
        }
        if (state is CountryScreenChangeRadio) {
          selectedNewCountry = _countryCubit.selectedNewCountry;
        }
        if (state is CountrySearchState) {
          _countrySearch = state.countriesSearch;
        }
        if (state is CountryScreenSuccessSaveData) {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) {
            return HomeScreen();
          }), (route) => false);
        }
      },
      builder: (context, state) {
        return Stack(
          children: [
            buildCountryList(),
            floatingBtn(),
          ],
        );
      },
    );
  }

  Widget buildCountryList() {
    return ListView.separated(
      itemBuilder: (context, index) {
        return _countryCubit.searchCountry.isNotEmpty
            ? BuildCountryItem(
                country: _countrySearch[index],
                selectedNewCountry: selectedNewCountry,
              )
            : BuildCountryItem(
                country: _allCountry[index],
                selectedNewCountry: selectedNewCountry,
              );
      },
      separatorBuilder: (context, index) {
        return const Divider(
          color: Colors.grey,
          height: 0.3,
        );
      },
      itemCount: _countryCubit.searchCountry.isNotEmpty
          ? _countrySearch.length
          : _allCountry.length,
    );
  }

  Widget floatingBtn() {
    return selectedNewCountry.isNotEmpty
        ? Positioned(
            bottom: 30,
            right: 20,
            child: FloatingActionButton(
              onPressed: () {
                _countryCubit.saveAllDataInStorage(selectedNewCountry);
                _countryCubit.clearSearchCharacter();
              },
              child: const Icon(Icons.done),
            ),
          )
        : Container();
  }
}
