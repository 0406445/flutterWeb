import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_my_web/pages/home/HomePage.dart';
import 'package:flutter_my_web/utils/lang/translation_service.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

void main() {
  runApp(GetMaterialApp(
    enableLog: true,
    defaultTransition: Transition.fade,
    opaqueRoute: Get.isOpaqueRouteDefault,
    popGesture: Get.isPopGestureEnable,
    locale: TranslationService.locale,
    // locale: Get.deviceLocale,//使用默认的语言环境
    fallbackLocale: TranslationService.fallbackLocale,
    //指定出错时候，默认的语言环境
    translations: TranslationService(),
    home: MyApp(),
  ));
  // 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
  SystemUiOverlayStyle systemUiOverlayStyle =
  SystemUiOverlayStyle(statusBarColor: Colors.transparent);
  SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    ScreenUtil.init(
      BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width,
        maxHeight: MediaQuery.of(context).size.height,
      ),
      // Orientation.portrait,
      designSize: Size(1920, 1080),
    );

    return MaterialApp(
      title: 'FlutterBlog',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
