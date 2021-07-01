import 'package:flutter/material.dart';
import 'package:flutter_my_web/widget/ImageWidget.dart';
import 'package:flutter_my_web/widget/TextWidget.dart';
import 'package:flutter_my_web/utils/DpUtils.dart';
import 'package:flutter/cupertino.dart';

class HomeTopBarWidget extends StatefulWidget {
  @override
  _HomeTopBarWidgetState createState() => _HomeTopBarWidgetState();
}

class _HomeTopBarWidgetState extends State<HomeTopBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        padding: EdgeInsets.only(left: 60.0.wDp, right: 60.0.wDp),
        height: 60.0.hDp,
        color: Color(0xcc42b983),
        child: Center(
          child: Row(
            children: [
              Row(
                children: [
                  Container(
                    height: 40.0.hDp,
                    width: 40.0.hDp,
                    child: ImageLoadUtils(
                      url:
                          "https://www.baidu.com/img/flexible/logo/pc/result.png",
                      radius: 90,
                    ),
                  ),
                  Container(
                    width: 10.0.wDp,
                  ),
                  SimpleText(
                    "Flutter Web",
                    fontSize: 25.sp,
                    color: Colors.white,
                  ),
                ],
              ),
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _TopCenterIconWidget(_TopCenterIconBean("首页",Icons.home)),
                  _TopCenterIconWidget(_TopCenterIconBean("标签",Icons.assistant_photo_sharp)),
                  _TopCenterIconWidget(_TopCenterIconBean("分类",Icons.fence)),
                  _TopCenterIconWidget(_TopCenterIconBean("关于",Icons.app_blocking_outlined)),
                  Container(
                    width: 100.0.wDp,
                    child: TextField(),
                  ),
                ],
              )),
              _WeatherWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class _TopCenterIconBean {
  String title = "";
  IconData icon = Icons.add;

  _TopCenterIconBean(this.title, this.icon);
}

class _TopCenterIconWidget extends StatefulWidget {
  _TopCenterIconBean __topCenterIconBean;

  _TopCenterIconWidget(this.__topCenterIconBean);

  @override
  __TopCenterIconWidgetState createState() => __TopCenterIconWidgetState();
}

class __TopCenterIconWidgetState extends State<_TopCenterIconWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Icon(
        widget.__topCenterIconBean.icon,
        color: Colors.white,
        size: 12.0.hDp,
      ),
      Container(
        width: 5.0.wDp,
      ),
      SimpleText(
        widget.__topCenterIconBean.title,
        fontSize: 16.sp,
        color: Colors.white,
      ),
      Container(
        width: 20.0.wDp,
      ),
    ]);
  }
}

class _WeatherWidget extends StatefulWidget {
  const _WeatherWidget({Key? key}) : super(key: key);

  @override
  __WeatherWidgetState createState() => __WeatherWidgetState();
}

class __WeatherWidgetState extends State<_WeatherWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      SimpleText("27°",color: Colors.white,),Container(width: 5.0.wDp,),
      SimpleText("厦门",color: Colors.white,),Container(width: 5.0.wDp,),
      SimpleText("天晴",color: Colors.white,),Container(width: 5.0.wDp,),
    ],);
  }
}
