import 'package:flutter/material.dart';
import 'package:islami_project/providers/settings_provider.dart';
import 'package:provider/provider.dart';

import 'Hadeth.dart';

class HadethDetails extends StatelessWidget {
  static const String routeName = "DetalsHadeth";
  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingsProvider>(context);
    Hadeth obj = (ModalRoute.of(context)?.settings.arguments) as Hadeth;
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage( settingsProvider.currentTheme==ThemeMode.light?
          "assets/images/bg3.png":"assets/images/bgDark.png",),
          fit: BoxFit.fill,
        )),
        child: Card(
            elevation: 12,
            margin: EdgeInsets.only(top: 100,bottom: 30, left:24,right: 24),
            color: Theme.of(context).cardColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            child: 
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(15),
                child: Text(
                  obj.content,
                  textDirection: TextDirection.rtl,
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
            )));
  }
}
