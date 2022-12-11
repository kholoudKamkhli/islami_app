import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/settings_provider.dart';

class LangugeBottomSheetTheme extends StatefulWidget{
  @override
  State<LangugeBottomSheetTheme> createState() => _LanguageBottomSheetThemeState();
}

class _LanguageBottomSheetThemeState extends State<LangugeBottomSheetTheme> {
  @override
  Widget build(BuildContext context) {
    var settingsProvider= Provider.of<SettingsProvider>(context);
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
              onTap: (){
                settingsProvider.changeLocale("en");
              },
            child: settingsProvider.currentLang=="en"?
            getSelectedItem("English"):getUnselected("English"),
          ),

          InkWell(
              onTap: (){
                settingsProvider.changeLocale("ar");
              },
            child: settingsProvider.currentLang=="ar"?
            getSelectedItem("العربية"):getUnselected("العربية"),
          )
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