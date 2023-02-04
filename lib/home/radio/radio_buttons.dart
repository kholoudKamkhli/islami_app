import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami_project/model/RadioResponse.dart';

import '../../model/Radios.dart';

class RadioButtons extends StatefulWidget {
  Radios radioResponse;
  AudioPlayer audioPlayer;

  RadioButtons({required this.radioResponse,required this.audioPlayer});

  @override
  State<RadioButtons> createState() => _RadioButtonsState();
}

class _RadioButtonsState extends State<RadioButtons> {

  play()async{
    int result = await widget.audioPlayer.play(widget.radioResponse?.radioUrl??"");
  }
  pause()async{
    await widget.audioPlayer.pause();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Text(widget.radioResponse!.name!,style: TextStyle(
              fontSize: 18
            ),textAlign: TextAlign.center,),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(onPressed: (){
                play();
              }, icon: Icon(Icons.play_arrow,color: Theme.of(context).accentColor,size: 39,)),
              IconButton(onPressed: (){
               pause();
              }, icon: Icon(Icons.pause,color: Theme.of(context).accentColor,size: 39)),
            ],
          ),
        ],),
    );;
  }
}
