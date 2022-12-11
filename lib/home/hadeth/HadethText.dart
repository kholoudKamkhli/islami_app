import 'package:flutter/material.dart';
import 'package:islami_project/home/hadeth/hadeth_details.dart';

import 'Hadeth.dart';

class HadethText extends StatelessWidget{
  Hadeth obj;
  HadethText(this.obj);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:(){
        Navigator.pushNamed(context, HadethDetails.routeName,
            arguments: Hadeth(obj.title,obj.content),
        );
      } ,
      child: Container(
      alignment: Alignment.center,
      child: Text(obj.title,style: Theme.of(context).textTheme.headline4),
      ),
    );
  }
}