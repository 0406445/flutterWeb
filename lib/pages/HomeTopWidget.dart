import 'package:flutter_my_web/utils/DpUtils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_weather_bg_null_safety/bg/weather_bg.dart';
import 'package:flutter_weather_bg_null_safety/utils/weather_type.dart';
import 'package:video_player/video_player.dart';

class HomeTopWidget extends StatefulWidget {

  @override
  _HomeTopWidgetState createState() => _HomeTopWidgetState();
}

class _HomeTopWidgetState extends State<HomeTopWidget> {

  VideoPlayerController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
    Future.delayed(Duration(seconds: 1),(){
      _controller!.play();
    });
  }
  @override
  void dispose() {
    super.dispose();
    _controller?.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      margin: EdgeInsets.only(left: 10.0.wDp,right: 10.0.wDp),
      child: Center(
        child: _controller!.value.isInitialized
            ? AspectRatio(
          aspectRatio: _controller!.value.aspectRatio,
          child: VideoPlayer(_controller!),
        )
            : Container(),
      ),
      // child: WeatherBg(
      //   weatherType: WeatherType.lightSnow,
      //   width: MediaQuery.of(context).size.width,
      //   height: MediaQuery.of(context).size.height,
      // ),
    );
  }
}
