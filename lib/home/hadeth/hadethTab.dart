import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_project/home/hadeth/Hadeth.dart';
import 'package:islami_project/home/hadeth/HadethText.dart';

class HadethTab extends StatefulWidget{
  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<Hadeth>hadeth = [];

  @override
  Widget build(BuildContext context) {
    if(hadeth.isEmpty)loadHadeth();
    // return (hadeth.isEmpty)?Center(child: CircularProgressIndicator(),):
    return
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(flex:2,child: Image.asset("assets/images/59253-quran-basmala-islamic-kufic-arabic-calligraphy-icon.png",alignment: Alignment.center,)),
          Expanded(
            flex: 5,
            child: ListView.separated(itemBuilder: (_,index){
              return HadethText(hadeth[index]);
            }, separatorBuilder: (_,index){
              return Container(color: Theme.of(context).accentColor,width: double.infinity,height: 1.5,margin: EdgeInsets.symmetric(vertical: 7,horizontal: 60),);
            }, itemCount: hadeth.length),
          )
          // Ink.image(image: AssetImage("assets/images/masjd.png"))
        ],
      );

  }

  void loadHadeth()async{
    List<Hadeth>temphadeth = [];
    String content = await rootBundle.loadString("assets/files/ahadeth .txt");
    List<String> allHadethContent = content.split("#");
    for(int i=0;i<allHadethContent.length;i++){
      List<String>singleHadethContent = allHadethContent[i].trim().split("\n");
      String title = singleHadethContent[0];
      singleHadethContent.removeAt(0);
      String content = singleHadethContent.join("\n");
      Hadeth h = new Hadeth(title, content);
      temphadeth.add(h);
      // hadeth.add(h);
      // print(title);
      // print(content);
    }
    hadeth = temphadeth;
    setState(() {

    });

  }
}