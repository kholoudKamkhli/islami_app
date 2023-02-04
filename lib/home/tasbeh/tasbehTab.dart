import 'package:flutter/material.dart';
import 'package:islami_project/MyTheme.dart';
import 'package:islami_project/providers/settings_provider.dart';
import 'package:provider/provider.dart';

class TasbehTab extends StatefulWidget{
  @override
  State<TasbehTab> createState() => _TasbehTabState();
}

class _TasbehTabState extends State<TasbehTab> {
  double angle = 0;
  int currentIndex = 0;
  int counter=0;
  List<String>azkar = ["سبحان الله","الحمدلله","لا اله الا الله","الله أكبر"];
  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingsProvider>(context);
    var mediaquery = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height:mediaquery.height*0.36,
            child: Stack(
              children: [
                Positioned(
                  top: 60,
                  left: mediaquery.width*0.19,
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        angle++;
                        counter++;
                        if(counter==34){
                          counter=0;
                          currentIndex++;
                          if(currentIndex==4){
                            currentIndex=0;
                          }
                        }
                      });
                    },
                    child: Transform.rotate(
                        angle:angle,
                          child: Image.asset(settingsProvider.currentTheme==ThemeMode.light?
                            "assets/images/body_seb7a.png":"assets/images/body_seb7a_Dark.png",height: mediaquery.height*0.28,)),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height:20),
          Text("عدد التسبيحات",style: Theme.of(context).textTheme.headline6?.copyWith(fontWeight: FontWeight.bold,)),
          SizedBox(height:20),
          Container(
            alignment: Alignment.center,
             height:81 ,
             width: 69,
            decoration: BoxDecoration(
              color: Theme.of(context).accentColor.withOpacity(0.8),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Text(counter.toString(),style: Theme.of(context).textTheme.headline6,textAlign: TextAlign.center,),

          ),
          SizedBox(height:40),
          Container(
            alignment: Alignment.center,
            height:51 ,
            width: 137,
            decoration: BoxDecoration(
              color: Theme.of(context).accentColor.withOpacity(0.8),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Text(azkar[currentIndex],style: Theme.of(context).textTheme.headline6,textAlign: TextAlign.center,),

          ),


        ],
      )
    );
  }
}