import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_my_web/utils/DpUtils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_my_web/widget/CardRadiusWidget.dart';
import 'package:flutter_my_web/widget/TextWidget.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:video_player/video_player.dart';

class HomeTopWidget extends StatefulWidget {
  @override
  _HomeTopWidgetState createState() => _HomeTopWidgetState();
}

class _HomeTopWidgetState extends State<HomeTopWidget> {
  var chewieController = ChewieController(
      aspectRatio: 16 / 9,
      autoPlay: true,
      looping: true,
      showControls: false,
      // fullScreenByDefault: true,
      allowFullScreen: true,
      // 占位图
      placeholder: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    "https://pic1.zhimg.com/80/v2-b4b71405d08bc1952025ba1bd5db54f3_1440w.jpg?source=1940ef5c"),
                fit: BoxFit.cover)),
      ),
      autoInitialize: true,
      videoPlayerController: VideoPlayerController.network(
          "https://assets.mixkit.co/videos/preview/mixkit-raft-going-slowly-down-a-river-1218-large.mp4"));
  @override
  void initState() {
    super.initState();
  }



  @override
  void dispose() {
    super.dispose();
    // videoPlayerController.dispose();
    chewieController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            // WeatherBg(
            //   weatherType: WeatherType.thunder,
            //   width: MediaQuery.of(context).size.width,
            //   height: MediaQuery.of(context).size.height,
            // ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Chewie(
                controller: chewieController,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Color(0x33000000),
            ),

            Center(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TopSwipeLayout(),
                Container(
                  height: 20.0.hDp,
                ),
                ZuoYouMengWidget(),
              ],
            ))
          ],
        ),
      ),
    );
  }
}

class TopSwipeLayout extends StatelessWidget {
  const TopSwipeLayout({Key? key}) : super(key: key);

  Widget _swiperBuilder(BuildContext context, int index) {
    return Container(
      color: Colors.blue,
      child: Center(
          child: SimpleText(
        "主要热点内容",
        fontSize: 20.sp,
        color: Colors.white,
      )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 800.0.wDp,
      height: 300.0.hDp,
      child: Swiper(
        itemBuilder: _swiperBuilder,
        itemCount: 3,
        pagination: new SwiperPagination(
            builder: DotSwiperPaginationBuilder(
          color: Colors.black54,
          activeColor: Colors.white,
        )),
        control: new SwiperControl(),
        scrollDirection: Axis.horizontal,
        autoplay: true,
        onTap: (index) => print('点击了第$index个'),
      ),
    );
  }
}

class ZuoYouMengWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 600.0.wDp,
      height: 100.0.hDp,
      child: ShapeRadiusWidget(
        circular: 10,
        bgColor: Colors.transparent,
        margin: EdgeInsets.all(0),
        padding: EdgeInsets.all(10.0.wDp),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SimpleText(
                "座右铭",
                fontSize: 16.sp,
                color: Colors.white,
              ),
              SimpleText(
                "沉淀后我愿意做个温暖的人，有自己的喜好，有自己的原则，有自己的信仰，不急功近利，不浮夸轻薄。宠辱不惊，淡定安逸，心静如水，不忘初心，方得始终。——凌茜",
                fontSize: 12.sp,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
