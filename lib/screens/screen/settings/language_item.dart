import 'package:flutter/material.dart';
import 'package:go_whats_app/shared/component/storage_pref.dart';
import 'package:go_whats_app/shared/data/repository/lang/app_local.dart';

import 'component/custom_button.dart';

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
                colorButton: Colors.teal,
                clickButton: () {
                  chooseLanguage('en').then((value) {
                    if (value) {
                      if (value) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return alertDialog(context);
                          },
                        );
                      }
                    }
                  });
                },
              ),
              CustomButton(
                title: 'عربي',
                colorButton: Colors.teal,
                clickButton: () {
                  chooseLanguage('ar').then((value) {
                    if (value) {
                      if (value) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return alertDialog(context);
                          },
                        );
                      }
                    }
                  });
                },
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget alertDialog(BuildContext context) {
    return Container(
      child: AlertDialog(
        title: Text(AppLocal.getCurrentValueTranslate(context, 'alertTitle')),
        content:
            Text(AppLocal.getCurrentValueTranslate(context, 'alertContent')),
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
      ),
    );
  }

  Future<bool> chooseLanguage(String lang) async {
    final bool isStorage = await StoragePref.setValue('current_lang', lang);
    return isStorage;
  }
}
