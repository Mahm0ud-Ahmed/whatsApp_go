import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_whats_app/logic/country_screen_logic/country_screen_cubit.dart';
import 'package:go_whats_app/logic/country_screen_logic/country_screen_state.dart';
import 'package:go_whats_app/screens/screen/home/home_screen.dart';
import 'package:go_whats_app/shared/data/model/country_model.dart';
import 'package:go_whats_app/shared/data/repository/lang/app_local.dart';
import 'package:go_whats_app/shared/go_whats_app_state.dart';

class CountryList extends StatefulWidget {
  const CountryList({Key key}) : super(key: key);

  @override
  _CountryListState createState() => _CountryListState();
}

class _CountryListState extends State<CountryList> {
  CountryScreenCubit countryCubit;

  @override
  void didChangeDependencies() {
    countryCubit = CountryScreenCubit.get(context);
    countryCubit.getDataFromAssets();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    List<CountryModel> country;
    List<CountryModel> searchCountry;

    CountryModel currentCountry;
    return BlocConsumer<CountryScreenCubit, GoWhatsAppState>(
      listener: (context, state) {
        if (state is SearchChangeState) {
          countryCubit.addCountrySearchInList();
          searchCountry = countryCubit.allCountrySearch;
        }
      },
      builder: (context, state) {
        country = CountryScreenCubit.get(context).allCountry;
        currentCountry = CountryScreenCubit.get(context).country;
        // print(countryCubit.allCountrySearch.length);
        return country.isNotEmpty
            ? Expanded(
                child: Stack(
                  children: [
                    ListView.separated(
                      itemBuilder: (context, index) {
                        if (countryCubit.searchCharacter.isNotEmpty) {
                          print(countryCubit.searchCharacter);
                          return buildItemTile(
                              searchCountry[index], currentCountry, context);
                        } else {
                          return buildItemTile(
                              country[index], currentCountry, context);
                        }
                      },
                      separatorBuilder: (context, index) {
                        return const Divider(
                          color: Colors.grey,
                          height: 0.3,
                        );
                      },
                      itemCount: countryCubit.searchCharacter.isNotEmpty
                          ? searchCountry.length
                          : country.length,
                      physics: const BouncingScrollPhysics(),
                    ),
                    if (currentCountry != null)
                      Align(
                        alignment: AlignmentDirectional.bottomEnd,
                        child: FloatingActionButton(
                          onPressed: () {
                            CountryScreenCubit.get(context)
                                .saveAllDataInStorage()
                                .then((isFlag) {
                              if (isFlag) {
                                CountryScreenCubit.get(context)
                                    .getAllDataFromStorage();
                                Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(builder: (context) {
                                    return HomeScreen(currentCountry);
                                  }),
                                  (route) => false,
                                );
                                countryCubit.clearSearchCharacter();
                              }
                            }).catchError((error) {
                              print(error.toString());
                            });
                          },
                          child: const Icon(Icons.done),
                        ),
                      ),
                  ],
                ),
              )
            : Container();
      },
    );
  }

  ListTile buildItemTile(
      CountryModel country, CountryModel currentCountry, BuildContext context) {
    return ListTile(
      title: Text(country.name),
      leading: Radio(
        value: country,
        groupValue: currentCountry,
        onChanged: (CountryModel country) {
          CountryScreenCubit.get(context).changeSelectedRadio(country);
          // print(country.name);
        },
      ),
      subtitle: Text(
          '${AppLocal.getCurrentValueTranslate(context, 'textCodeInList')} ${country.callingCode}'),
      onTap: () {
        CountryScreenCubit.get(context).changeSelectedRadio(country);
      },
    );
  }
}
