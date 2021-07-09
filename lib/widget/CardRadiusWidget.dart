import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_my_web/utils/DpUtils.dart';
class ShapeRadiusWidget extends StatelessWidget {
  Widget? child;

  EdgeInsetsGeometry? margin = null;
  EdgeInsetsGeometry? padding = null;
  Color? bgColor;
  double circular = 6;
  ShapeRadiusWidget( {this.child,this.margin,this.padding, this.bgColor,this.circular = 6}) {
    margin ??= EdgeInsets.only(left: 10.0.wDp, right: 10.0.wDp, bottom: 10.0.wDp);
    padding ??= EdgeInsets.all(10.0.wDp);
    bgColor??= Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:margin,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(circular)),
          color: bgColor,
          boxShadow: [
            //卡片阴影
            BoxShadow(
                color: Colors.black54,
                offset: Offset(1.0.wDp, 1.0.wDp),
                blurRadius: 4.0.wDp)
          ]),
      padding: padding,
      child: child,
    );
  }
}



