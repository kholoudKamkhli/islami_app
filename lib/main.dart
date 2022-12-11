import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:islami_project/MyTheme.dart';
import 'package:islami_project/home/hadeth/hadeth_details.dart';
import 'package:islami_project/home/home_screen.dart';
import 'package:islami_project/home/quran/surah_details.dart';
import 'package:islami_project/providers/settings_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
void main() {
  runApp(ChangeNotifierProvider(
    create:(buildContext)=>SettingsProvider(),
      child: MyApp(),
  ));

}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var settingsProvider= Provider.of<SettingsProvider>(context);
    return MaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate,
        // delegate from flutter_localization
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        // delegate from localization package.
      ],
      supportedLocales: [
        Locale('en',''),
        Locale('ar',''),
      ],
      routes:{
        home_screen.routeName:(_)=>home_screen() ,
        SurahDetails.routeName:(_)=>SurahDetails() ,
        HadethDetails.routeName:(_)=>HadethDetails(),
       },
      initialRoute:home_screen.routeName ,
      theme: MyTheme.lightTheme,
      darkTheme: MyTheme.darkTheme,
      themeMode: settingsProvider.currentTheme,
      locale: Locale(settingsProvider.currentLang),

    );
  }
}