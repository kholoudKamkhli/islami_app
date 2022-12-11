import 'package:flutter/material.dart';
import 'package:islami_project/MyTheme.dart';
import 'package:islami_project/home/hadeth/hadethTab.dart';
import 'package:islami_project/home/quran/quranTab.dart';
import 'package:islami_project/home/settings/settings_tab.dart';
import 'package:islami_project/home/tasbeh/tasbehTab.dart';
import 'package:islami_project/home/radio/radioTab.dart';
import 'package:islami_project/providers/settings_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class home_screen extends StatefulWidget{
  static const String routeName = "home";

  @override
  State<home_screen> createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingsProvider>(context);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            settingsProvider.currentTheme==ThemeMode.light?
              "assets/images/bg3.png":"assets/images/bgDark.png"),
          fit: BoxFit.fill,
        )
      ),
      child: Scaffold(
        //backgroundColor:Colors.transparent,
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.app_title),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (selected){

          setState(() {
            selectedIndex = selected;
          });
        },
          currentIndex: selectedIndex,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: ImageIcon(AssetImage("assets/images/quranrr.png")),
        label: AppLocalizations.of(context)!.quran,),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: ImageIcon(AssetImage("assets/images/quran-quran-svgrepo-com.png")),
            label: AppLocalizations.of(context)!.hadeth,),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: ImageIcon(AssetImage("assets/images/sebha_blue.png")),
            label: AppLocalizations.of(context)!.tasbeh,),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: const ImageIcon(AssetImage("assets/images/radio.png")),
            label: AppLocalizations.of(context)!.radio,),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon:const Icon(Icons.settings),
            label: AppLocalizations.of(context)!.settings,),
        ]
      ),
        body: tabs[selectedIndex],
      ),
    );

  }
  List<Widget> tabs = [QuranTab(),HadethTab(),TasbehTab(),RadioTab(),SettingsTab()];
}