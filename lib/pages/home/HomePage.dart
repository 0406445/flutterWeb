import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_my_web/logic/HomeGetLogic.dart';
import 'package:flutter_my_web/pages/home/HomeTopBarWidget.dart';
import 'package:flutter_my_web/pages/home/HomeTopWidget.dart';
import 'package:get/get.dart';
import 'package:flutter_my_web/utils/DpUtils.dart';

import 'HomeListItemView.dart';

class HomePage extends StatefulWidget {
  final HomeGetLogic _homeGetLogic = Get.put(HomeGetLogic());

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  "https://pic1.zhimg.com/80/v2-b4b71405d08bc1952025ba1bd5db54f3_1440w.jpg?source=1940ef5c"),
              fit: BoxFit.cover)),
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                HomeTopWidget(),
                Container(
                  height: 20.0.hDp,
                ),
                Container(
                  margin: EdgeInsets.only(left: 300.0.wDp, right: 300.0.wDp),
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return HomeListItemView(HomeListItemBean());
                      }),
                ),
              ],
            ),
          ),
          HomeTopBarWidget(),
        ],
      ),
    );
  }
}
