import 'package:logger/logger.dart';

import 'LogLongPrintUtils.dart';

///一个日志打印工具类
class LogUtils {
  static const String TAG = "TAG";
  static bool isPrintDebug = true;
  LogUtils._();
  static String tag = TAG;
  static var logger = Logger(
    printer: PrettyPrinter(
        methodCount: 3, // number of method calls to be displayed
        errorMethodCount: 8, // number of method calls if stacktrace is provided
        lineLength: 120, // width of the output
        colors: true, // Colorful log messages
        printEmojis: true, // Print an emoji for each log message
        printTime: false // Should each log print contain a timestamp
    ),
  );

  //第一步：设置平台，并进行命名
  // static const _platform = const MethodChannel('com.yancy.flutter.plugins/log');



  //第二步，设置相关需要传递的方法
  //invokeMethod方法接收的参数，第一个必选参数，设置的是方法的名称；后面的参数为可选的需要传递的参数
  static void i( String msg, {String tag = TAG}) {
    if (!isPrintDebug)return;
//    _platform.invokeMethod('logI', {'tag': tag, 'msg': msg});
//  print("${tag} : ${msg}");
   logger.i("${tag} : ${msg}");
    // LogLongPrintUtils.v("${tag} : ${msg}");
  }

  static void d( String msg, {String tag = TAG}) {
    if (!isPrintDebug)return;
//    _platform.invokeMethod('logD', {'tag': tag, 'msg': msg});
//    print("${tag} : ${msg}");
   logger.d("${tag} : ${msg}");
    // LogLongPrintUtils.v("${tag} : ${msg}");
  }

  static void v( String msg, {String tag = TAG}) {
    if (!isPrintDebug)return;
//    _platform.invokeMethod('logV', {'tag': tag, 'msg': msg});
//    print("${tag} : ${msg}");
   logger.v("${tag} : ${msg}");
    // LogLongPrintUtils.v("${tag} : ${msg}");
  }

  static void w( String msg, {String tag = TAG}) {
    if (!isPrintDebug)return;
//    _platform.invokeMethod('logW', {'tag': tag, 'msg': msg});
//    print("${tag} : ${msg}");
   logger.w("${tag} : ${msg}");
    // LogLongPrintUtils.v("${tag} : ${msg}");
  }

  static void e( String msg, {String tag = TAG}) {
    if (!isPrintDebug)return;
//    _platform.invokeMethod('logE', {'tag': tag, 'msg': msg});
//    print("${tag} : ${msg}");
   logger.e("${tag} : ${msg}");
    // LogLongPrintUtils.v("${tag} : ${msg}");
  }

}
