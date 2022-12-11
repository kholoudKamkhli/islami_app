import 'package:flutter/material.dart';
import 'package:islami_project/home/quran/surah_details.dart';
import 'package:islami_project/home/quran/surah_details_args.dart';

class SurahName extends StatelessWidget{
  String title ;
  int index;
  SurahName(this.title,this.index);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, SurahDetails.routeName,arguments: SurahDetailsArgs(name: title, index: index));
      },
      child: Container(
        alignment: Alignment.center,
        child: Text(title,style: Theme.of(context).textTheme.headline4),
      ),
    );
  }
}