

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_project/home/radio/radio_buttons.dart';
import 'package:islami_project/model/RadioResponse.dart';

import '../../api_manager_radio/radio_api.dart';
class RadioTab extends StatefulWidget{
  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
  late var radioResponse;
  late AudioPlayer audioPlayer;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    radioResponse = RadioManager.fetchAlbum();
    audioPlayer = AudioPlayer();
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<RadioResponse>(
      future: radioResponse,
      builder: (buildContext,snapshot){
        if(snapshot.hasData){
          return   Column(
             children: [
               Expanded(
                 flex: 3,
                   child: Image.asset("assets/images/551-5517026_radio-vector-png-old-radio-png-vector-transparent.png")),
               //SizedBox(height: 20,),
               Expanded(
                 flex: 2,
                 child: ListView.builder(
                   scrollDirection: Axis.horizontal,
                   physics: PageScrollPhysics(),
                   itemBuilder: (buildContext,index){
                     //return RadioButtons(radioResponse: snapshot.data!.radios![index]);
                     return RadioButtons(radioResponse:snapshot.data!.radios![index],audioPlayer: audioPlayer,);
                   },
                   itemCount: snapshot.data!.radios!.length,
                 ),
               ),
             ],
           );
          //return Text(snapshot.data?.radios?[0]?.name??"");
        }
        else if(snapshot.hasError){
          return Center(child: IconButton(onPressed: (){
            RadioManager.fetchAlbum();
          },icon: Icon(Icons.refresh),color: Theme.of(context).primaryColor,iconSize: 36,),);
        }
        else{
          return Center(child: CircularProgressIndicator(color: Theme.of(context).primaryColor,),);
        }
      },
      //  Column(
      //   children: [
      //     Expanded(
      //       flex: 3,
      //         child: Image.asset("assets/images/551-5517026_radio-vector-png-old-radio-png-vector-transparent.png")),
      //     //SizedBox(height: 20,),
      //     Expanded(
      //       flex: 2,
      //       child: Column(
      //         children: [
      //           Text(AppLocalizations.of(context)!.radio_button,style:Theme.of(context).textTheme.headline4
      //           ),
      //           Row(
      //             mainAxisAlignment: MainAxisAlignment.center,
      //             children: [
      //               IconButton(onPressed: (){}, icon: Icon(Icons.play_arrow,color: Theme.of(context).primaryColor,)),
      //               IconButton(onPressed: (){}, icon: Icon(Icons.pause,color: Theme.of(context).primaryColor,)),
      //             ],
      //           ),
      //         ],
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}