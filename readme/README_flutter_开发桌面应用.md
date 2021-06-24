#配置  将flutter切换到beta版
```
flutter channel beta
flutter upgrade
flutter config --enable-linux-desktop // to enable Linux.
flutter config --enable-macos-desktop // to enable macOS.
flutter config --enable-windows-desktop // to enable Windows.

```
# 在github上我们能发现两个方案，一个是flutter官方的方案flutter-desktop-embedding还有一个是使用go和glfw开发的go-flutter
#打包


#不能使用的插件     flutter_web_plugins

#参考
fluter_file_picker，里面有使用go完成本地接口对接

学习
    https://blog.csdn.net/qq_28478281/article/details/95615208  //插件用法
    https://www.jianshu.com/p/37fcd2fce80b          //安装教程
    https://www.jianshu.com/p/fcf115868768          //两种创建方式的对比
官方组件
    https://github.com/google/flutter-desktop-embedding
    https://github.com/go-flutter-desktop/plugins
    https://github.com/go-flutter-desktop/hover
 
修改main.dart
import 'package:flutter/foundation.dart' show debugDefaultTargetPlatformOverride;
void main() {
  debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;//这句话很关键
  runApp(MyApp());
}

安装完go环境之后，然后下载一个hover库      执行失败的话去gland执行
set GO111MODULE=on
go get -u -a github.com/go-flutter-desktop/hover
安装mingw64
C:\Program Files\mingw-w64\x86_64-8.1.0-posix-seh-rt_v6-rev0\mingw64\bin配置到PATH下面，然后打开cmd，输入gcc -v

运行：hover init github.com/my-organization/myapp
    会自动生成   generated_plugin_registrant.dart 文件夹


生成一个go文件夹，把pubspec.yaml拷贝进入，可以到hover.yaml修改指定的运行文件，运行hover run

hover 指令
    hover build --help
    Flutter run key commands.
    r Hot reload.
    R Hot restart.
    h Repeat this help message.
    d Detach (terminate "flutter run" but leave application running).
    c Clear the screen
    q Quit (terminate the application on the device).
    An Observatory debugger and profiler on Flutter test device is available at: http://127.0.0.1:59809/RKHmRQAxePA=/




可以做些桌面的功能
    关于自己文件管理器的项目
        1.一键把文件中的图片导入到服务器中
        2.采集指定网址的图片


    文件工具类型
        1.获取指定文件夹中所有的文件名输出到txt中































