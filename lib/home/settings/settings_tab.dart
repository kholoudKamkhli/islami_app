import 'package:flutter/material.dart';
import 'package:islami_project/home/settings/lang_bottom_sheet.dart';
import 'package:islami_project/home/settings/theme_bottom_sheet.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../providers/settings_provider.dart';
class SettingsTab extends StatefulWidget{
  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  @override
  Widget build(BuildContext context) {
    var settingsProvider= Provider.of<SettingsProvider>(context);
    return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 40,),
            Container(margin: EdgeInsets.symmetric(horizontal: 10),
                child: Text(AppLocalizations.of(context)!.theme, style: Theme
                    .of(context)
                    .textTheme
                    .subtitle2,)),
            InkWell(
              onTap: () {
                showThemeBottomSheet();
              },
              child: Container(
                margin: EdgeInsets.all(5),
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: Theme
                      .of(context)
                      .accentColor, width: 1),

                ),
                child: Text(settingsProvider.currentTheme==ThemeMode.light?
                  AppLocalizations.of(context)!.light:AppLocalizations.of(context)!.dark, style: Theme
                    .of(context)
                    .textTheme
                    .headline6,),
              ),
            ),
            SizedBox(height: 8,),
            Container(margin: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  AppLocalizations.of(context)!.language, style: Theme
                    .of(context)
                    .textTheme
                    .subtitle2,)),
            Container(
              margin: EdgeInsets.all(5),
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: Theme
                    .of(context)
                    .accentColor, width: 1),

              ),
              child: InkWell(
                onTap:(){
                  showLangugeBottomSheetTheme();
                },
                child: Text(settingsProvider.currentLang=="en"?"English":"العربية", style: Theme
                    .of(context)
                    .textTheme
                    .headline6,),
              ),
            ),


          ],
        )
    );
  }
  void showThemeBottomSheet(){
    showModalBottomSheet(context: context, builder:(buildContext){
      return BottomSheetTheme();
    } );
  }
  void showLangugeBottomSheetTheme(){
    showModalBottomSheet(context: context, builder:(buildContext){
      return LangugeBottomSheetTheme();
    });
  }
}