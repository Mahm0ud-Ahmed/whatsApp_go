import 'package:flutter/material.dart';
import 'package:go_whats_app/core/app_localization.dart';
import 'package:go_whats_app/data/local/country_model.dart';
import 'package:go_whats_app/logic/cubit/country_cubit.dart';

class BuildCountryItem extends StatefulWidget {
  const BuildCountryItem({Key key, this.country, this.selectedNewCountry})
      : super(key: key);
  final CountryModel country;
  final String selectedNewCountry;
  @override
  State<BuildCountryItem> createState() => _BuildCountryItemState();
}

class _BuildCountryItemState extends State<BuildCountryItem> {
  CountryCubit _cubit;
  @override
  void initState() {
    _cubit = CountryCubit.get(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.country.name),
      leading: Radio(
        value: widget.country.code,
        groupValue: widget.selectedNewCountry,
        onChanged: (String countryCode) {
          _cubit.changeSelectedRadio(countryCode);
        },
      ),
      subtitle: Text(
          '${AppLocal.getCurrentValueTranslate(context, 'textCodeInList')} ${widget.country.callingCode}'),
      onTap: () {
        _cubit.changeSelectedRadio(widget.country.code);
      },
    );
  }
}
