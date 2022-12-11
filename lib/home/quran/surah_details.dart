import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_project/home/quran/surah_details_args.dart';
import 'package:islami_project/home/quran/verses_widget.dart';
import 'package:provider/provider.dart';

import '../../providers/settings_provider.dart';

class SurahDetails extends StatefulWidget{
  static const routeName = "SurahDetails";

  @override
  State<SurahDetails> createState() => _SurahDetailsState();
}

class _SurahDetailsState extends State<SurahDetails> {
  List<String>verses = [];

  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingsProvider>(context);
    SurahDetailsArgs obj = (ModalRoute.of(context)?.settings.arguments) as SurahDetailsArgs;
    if(verses.isEmpty)readFile(obj.index+1);
    return Container(
        decoration: BoxDecoration(
        image: DecorationImage(
        image: AssetImage(
            settingsProvider.currentTheme==ThemeMode.light?
            "assets/images/bg3.png":"assets/images/bgDark.png",
           ),
    fit: BoxFit.fill,
    )
    ),
    child: Scaffold(
      appBar: AppBar(
        title: Text(obj.name),
      ),
      body: verses.isEmpty?Center(child:CircularProgressIndicator()):
      Card(
        elevation: 12,
        margin: EdgeInsets.symmetric(vertical: 60,horizontal: 24),
        color: Theme.of(context).cardColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: ListView.separated(itemBuilder: (_,index){
          return VersesWidget(verses[index],index+1);
        },
          itemCount: verses.length,separatorBuilder: (_,__){
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 40,vertical:0),
            height: 1,
            color: Theme.of(context).accentColor,
          );
          },),
      ),
    ));
  }

  void readFile(int fileIndex)async{
    String fileContent = await rootBundle.loadString("assets/files/$fileIndex.txt");
    List<String>Lines = fileContent.trim().split("\n");
    setState(() {
      verses = Lines;
    });
  }
}