import 'package:flutter/material.dart';
import 'package:islami_project/home/quran/surah_name_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class QuranTab extends StatelessWidget{
  List<String>name = ["الفاتحه","البقرة","آل عمران","النساء","المائدة","الأنعام","الأعراف","الأنفال","التوبة","يونس","هود"
  ,"يوسف","الرعد","إبراهيم","الحجر","النحل","الإسراء","الكهف","مريم","طه","الأنبياء","الحج","المؤمنون"
  ,"النّور","الفرقان","الشعراء","النّمل","القصص","العنكبوت","الرّوم","لقمان","السجدة","الأحزاب","سبأ"
  ,"فاطر","يس","الصافات","ص","الزمر","غافر","فصّلت","الشورى","الزخرف","الدّخان","الجاثية","الأحقاف"
  ,"محمد","الفتح","الحجرات","ق","الذاريات","الطور","النجم","القمر","الرحمن","الواقعة","الحديد","المجادلة"
  ,"الحشر","الممتحنة","الصف","الجمعة","المنافقون","التغابن","الطلاق","التحريم","الملك","القلم","الحاقة","المعارج"
  ,"نوح","الجن","المزّمّل","المدّثر","القيامة","الإنسان","المرسلات","النبأ","النازعات","عبس","التكوير","الإنفطار"
  ,"المطفّفين","الإنشقاق","البروج","الطارق","الأعلى","الغاشية","الفجر","البلد","الشمس","الليل","الضحى","الشرح"
  ,"التين","العلق","القدر","البينة","الزلزلة","العاديات","القارعة","التكاثر","العصر",
  "الهمزة","الفيل","قريش","الماعون","الكوثر","الكافرون","النصر","المسد","الإخلاص","الفلق","الناس"];
  @override
  Widget build(BuildContext context) {
    return
      Container(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(flex:2,child: Image.asset("assets/images/masjd.png",alignment: Alignment.center,)),
            Container(color: Theme.of(context).accentColor,height: 2,margin: EdgeInsets.symmetric(vertical: 10,horizontal: 60),),
            Text(AppLocalizations.of(context)!.chapter_name,style:Theme.of(context).textTheme.headline4
            ),
            Container(color: Theme.of(context).accentColor,height: 2,margin: EdgeInsets.symmetric(vertical: 10,horizontal: 60),),
            Expanded(
              flex: 5,
              child: ListView.separated(itemBuilder: (_,index){
                return SurahName(name[index],index);
              }, separatorBuilder: (_,index){
                return Container(color: Theme.of(context).accentColor,width: double.infinity,height: 1.5,margin: EdgeInsets.symmetric(vertical: 7,horizontal: 60),);
              }, itemCount: name.length),
            )
            // Ink.image(image: AssetImage("assets/images/masjd.png"))
          ],
    ),
      );
  }
}