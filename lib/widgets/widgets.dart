import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget defaultText({
  required String text,
  double size = 5.0,
  Color color = Colors.black,
  FontWeight? fontWeight,
}) =>
    Text(
      text,
      style:
      TextStyle(fontSize: size, fontWeight: fontWeight, color: color),
    );

Widget defaultBottom({
  double size = 60.0,
Color color=Colors.white,
  Color textColor=Colors.white,
  Color iconColor=Colors.white,
  Color borderColor=Colors.white,
  var isIcon=false,
   IconData? icon,
  String text='',
  double textSize=30.0,
}) =>
    Container(
      margin: const EdgeInsets.only(right: 10.0),
      width: size,
      height: size,
      decoration: BoxDecoration(
        border: Border.all(color: borderColor,width: 1.0),
        color: color,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child:isIcon?Center(child: Icon(icon,color: iconColor,)): Center(
          child: defaultText(text: text, size: textSize, color: textColor)),
    );