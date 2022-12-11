import 'package:flutter/material.dart';

class VersesWidget extends StatelessWidget{
  int index;
  String content;
  VersesWidget(this.content,this.index);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 9),
      child: Text("$content ($index)",textDirection:TextDirection.rtl,textAlign:TextAlign.center,
      style:Theme.of(context).textTheme.headline6),
    );
  }
}