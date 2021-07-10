import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_my_web/widget/CardRadiusWidget.dart';
import 'package:flutter_my_web/widget/ImageWidget.dart';
import 'package:flutter_my_web/utils/DpUtils.dart';
import 'package:flutter_my_web/widget/TextWidget.dart';

class HomeListItemBean {
  String title = "";
  String message = "";
  String url = "";
  String time = "";
  List<String> tags = [];
}

class HomeListItemView extends StatelessWidget {
  HomeListItemBean _bean;

  HomeListItemView(this._bean);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ShapeRadiusWidget(
        padding: EdgeInsets.zero,
        child: Container(
          height: 200.0.hDp,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  child: ImageLoadUtils(
                    fit: BoxFit.fill,
                    url:
                        "https://pic1.zhimg.com/80/v2-b4b71405d08bc1952025ba1bd5db54f3_1440w.jpg?source=1940ef5c",
                  ),
                ),
              ),
              Expanded(
                  child: Container(
                padding: EdgeInsets.all(10.0.wDp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: [Icon(Icons.access_time)],),
                    SimpleText("${_bean.title}",fontSize: 16.sp,),
                    SimpleText("内容\n内容\n内容\n",fontSize: 12.sp,),
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
