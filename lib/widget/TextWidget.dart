import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TitleWdiget extends StatelessWidget {
  String? title;
  AlignmentGeometry _alignmentGeometry = Alignment.topLeft;
  TitleWdiget(this.title,{AlignmentGeometry? alignmentGeometry }){
    if (alignmentGeometry != null){
      _alignmentGeometry = alignmentGeometry;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: _alignmentGeometry,
      child: Text(
        title!,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class SecondTitleWdiget extends StatelessWidget {
  String title;
  AlignmentGeometry _alignmentGeometry = Alignment.topLeft;

  SecondTitleWdiget(this.title,{AlignmentGeometry? alignmentGeometry }){
    if (alignmentGeometry != null){
      _alignmentGeometry = alignmentGeometry;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: _alignmentGeometry,
      child: Text(
        title,
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),

      ),
    );
  }
}

class MessageWdiget extends StatelessWidget {
  String title;
  AlignmentGeometry _alignmentGeometry = Alignment.topLeft;
  MessageWdiget(this.title,{AlignmentGeometry? alignmentGeometry }){
    if (alignmentGeometry != null){
      _alignmentGeometry = alignmentGeometry;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: _alignmentGeometry,
        child: Text(
          title,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
        ),
      ),
    );
  }
}




class SimpleText extends Text {

  SimpleText(String data, {Color? color, double fontSize = 14, FontWeight fontWeight = FontWeight.normal})
      : super(data,
            style: TextStyle(color: color ?? Colors.black, fontSize: fontSize,fontWeight: fontWeight));
}
