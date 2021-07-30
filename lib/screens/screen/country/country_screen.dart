import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_whats_app/logic/country_screen_logic/country_screen_cubit.dart';
import 'package:go_whats_app/screens/screen/country/body.dart';
import 'package:go_whats_app/shared/data/repository/lang/app_local.dart';
import 'package:go_whats_app/shared/go_whats_app_state.dart';

class CountryScreen extends StatefulWidget {
  const CountryScreen({Key key}) : super(key: key);

  @override
  _CountryScreenState createState() => _CountryScreenState();
}

class _CountryScreenState extends State<CountryScreen> {
  final TextEditingController _searchController = TextEditingController();
  bool isSearch = false;
  CountryScreenCubit countryCubit;

  @override
  void initState() {
    countryCubit = CountryScreenCubit.get(context);
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // isSearch = CountryScreenCubit.get(context).isSearch;
    // print(isSearch);
    return BlocBuilder<CountryScreenCubit, GoWhatsAppState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: isSearch ? buildSearchItem() : const Text('WhatsApp Go'),
            actions: buildAppBarAction(),
          ),
          body: const Body(),
        );
      },
    );
  }

  Widget buildSearchItem() {
    return TextField(
      controller: _searchController,
      onChanged: (String character) {
        countryCubit.setSearchCharacter(character);
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        hintText: AppLocal.getCurrentValueTranslate(context, 'searchTextHint'),
        hintStyle: TextStyle(color: Colors.grey.shade300),
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        filled: true,
        fillColor: Colors.blue.shade300,
      ),
      style: const TextStyle(color: Colors.white),
      cursorColor: Colors.orange,
      cursorHeight: 24,
    );
  }

  List<Widget> buildAppBarAction() {
    if (isSearch) {
      return <Widget>[
        IconButton(
          onPressed: () {
            // CountryScreenCubit.get(context).changeSearchState();
            CountryScreenCubit.get(context).clearSearchCharacter();
            setState(() {
              _clearSearchField();
            });
            Navigator.pop(context);
          },
          icon: const Icon(Icons.close),
        ),
      ];
    } else {
      return <Widget>[
        IconButton(
          onPressed: () {
            // CountryScreenCubit.get(context).changeSearchState();
            ModalRoute.of(context)
                .addLocalHistoryEntry(LocalHistoryEntry(onRemove: () {
              _stopSearch();
            }));
            setState(() {
              isSearch = true;
            });
          },
          icon: const Icon(Icons.search),
        ),
      ];
    }
  }

  void _stopSearch() {
    CountryScreenCubit.get(context).clearSearchCharacter();
    setState(() {
      _clearSearchField();
      isSearch = false;
    });
  }

  void _clearSearchField() {
    _searchController.clear();
  }
}
