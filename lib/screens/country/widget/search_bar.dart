import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_whats_app/core/app_localization.dart';
import 'package:go_whats_app/logic/cubit/country_cubit.dart';
import 'package:go_whats_app/logic/cubit/country_state.dart';
import 'package:go_whats_app/screens/country/widget/custom_text_field.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key key}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  bool _isSearch;
  CountryCubit _cubit;

  @override
  void initState() {
    _cubit = CountryCubit.get(context);
    _isSearch = _cubit.isSearch;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CountryCubit, GoWhatsAppState>(
      builder: (context, state) {
        if (state is SearchChangeState) {
          _isSearch = _cubit.isSearch;
        }
        return AppBar(
          title: _isSearch
              ? CustomTextField(
                  onChange: (country) => _cubit.setSearchCountry(country),
                  hintText: AppLocal.getCurrentValueTranslate(
                      context, 'searchTextHint'),
                  fillColor: Colors.blue.shade300,
                  lines: 1,
                )
              : const Text('WhatsApp Go'),
          actions: buildAppBarAction(),
        );
      },
    );
  }

  List<Widget> buildAppBarAction() {
    if (_isSearch) {
      return <Widget>[
        IconButton(
          onPressed: () {
            _cubit.clearSearchCharacter();
            Navigator.pop(context);
          },
          icon: const Icon(Icons.close),
        ),
      ];
    } else {
      return <Widget>[
        IconButton(
          onPressed: () {
            ModalRoute.of(context).addLocalHistoryEntry(
              LocalHistoryEntry(
                onRemove: () {
                  _cubit.clearSearchCharacter();
                  _cubit.changeSearchState();
                },
              ),
            );
            _cubit.changeSearchState();
          },
          icon: const Icon(Icons.search),
        ),
      ];
    }
  }
}
