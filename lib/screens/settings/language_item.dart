import 'package:flutter/material.dart';
import 'package:go_whats_app/core/app_localization.dart';
import 'package:go_whats_app/logic/cubit/country_cubit.dart';
import 'package:go_whats_app/screens/settings/widget/custom_button.dart';

class LanguageItem extends StatelessWidget {
  const LanguageItem();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocal.getCurrentValueTranslate(context, 'changeLanguageSetting'),
            style: Theme.of(context).textTheme.headline6.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomButton(
                title: 'English',
                clickButton: () async {
                  final bool isStorage = await changeLanguage(context, 'en');
                  if (isStorage) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return alertDialog(context);
                      },
                    );
                  }
                },
              ),
              CustomButton(
                title: 'عربي',
                clickButton: () async {
                  final bool isStorage = await changeLanguage(context, 'ar');
                  if (isStorage) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return alertDialog(context);
                      },
                    );
                  }
                },
              ),
            ],
          )
        ],
      ),
    );
  }

  Future<bool> changeLanguage(BuildContext context, String newLang) async {
    return await CountryCubit.get(context).chooseLanguage(newLang);
  }

  Widget alertDialog(BuildContext context) {
    return AlertDialog(
      title: Text(AppLocal.getCurrentValueTranslate(context, 'alertTitle')),
      content: Text(AppLocal.getCurrentValueTranslate(context, 'alertContent')),
      actions: [
        OutlinedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child:
              Text(AppLocal.getCurrentValueTranslate(context, 'alertCancel')),
        ),
        OutlinedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(AppLocal.getCurrentValueTranslate(context, 'alertOk')),
        ),
      ],
    );
  }
}
