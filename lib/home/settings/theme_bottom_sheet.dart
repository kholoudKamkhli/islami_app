import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/settings_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class BottomSheetTheme extends StatefulWidget{
  @override
  State<BottomSheetTheme> createState() => _BottomSheetThemeState();
}

class _BottomSheetThemeState extends State<BottomSheetTheme> {
  @override
  Widget build(BuildContext context) {
    var settingsProvider= Provider.of<SettingsProvider>(context);
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            onTap: (){
              settingsProvider.changeTheme(ThemeMode.light);
            },

              child:
              settingsProvider.isDarkMode()?getUnselected(AppLocalizations.of(context)!.light):getSelectedItem(AppLocalizations.of(context)!.light)),
          InkWell(
            onTap: (){
              settingsProvider.changeTheme(ThemeMode.dark);
            },
              child:
                  settingsProvider.isDarkMode()?
    getSelectedItem(AppLocalizations.of(context)!.dark):getUnselected(AppLocalizations.of(context)!.dark)),
        ],
      ),
    );
  }

  Widget getSelectedItem(String title){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [

        Container(padding: EdgeInsets.symmetric(vertical: 8,horizontal: 12),child: Text(title,style:Theme.of(context).textTheme.headline6?.copyWith(color: Theme.of(context).accentColor))),
        Container(padding: EdgeInsets.symmetric(vertical: 8,horizontal: 12),child: Icon(Icons.check,color: Theme.of(context).accentColor,)),
      ],
    );
  }

  Widget getUnselected(String title){
    return Container(padding: EdgeInsets.symmetric(vertical: 8,horizontal: 12),child: Text(title,style:Theme.of(context).textTheme.headline6));
  }
}