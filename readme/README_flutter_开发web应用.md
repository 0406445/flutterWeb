我能使用 Flutter 插件么？
https://pub.flutter-io.cn/flutter/packages?platform=web
是的，目前有很多插件已经支持了 web。在 pub.dev 上使用 web 过滤以找到更新的插件清单。你也可以为已有的或者 你自己编写的 plugin 添加 web 支持。

我能在 Web 应用中使用 dart:io 这个 package 吗？
不行。文件系统在浏览器中是无法访问的。对于网络功能来说，请使用 http package。请注意，安全方面的工作有所不同，因为浏览器（而不是应用程序）控制 HTTP 请求上的标头。

如何在 Web 用户界面中显示前进和后退按钮？
Web 应用支持浏览器的后退按钮。前进按钮尚未支持。有关更多信息，请参阅 Issue 32248。

复制和粘贴功能状况如何？
在移动设备上复制和粘贴可以使用。如果你遇到了什么问题，请 提一个 issue。

我该如何把一个 web 应用嵌入到一个网页中？
你可以通过下面这个例子，以 iframe 来内嵌，把 URL 替换成托管 Flutter Web 的页面 URL：

content_copy
<iframe src="URL"></iframe>
实现跨域资源共享
HTTP 请求适用于移动设备，但不适用于网络。 Web 应用程序有特殊的安全限制。如果你遇到问题，请检查正在访问的 Web 服务器是否设置了接受来自托管 Flutter 应用程序的域的请求的 CORS 标头。


#web 打包相关
https://www.cnblogs.com/qqcc1388/p/14009323.html
https://ai-exception.blog.csdn.net/article/details/93243500?utm_medium=distribute.pc_relevant.none-task-blog-BlogCommendFromBaidu-1.control&depth_1-utm_source=distribute.pc_relevant.none-task-blog-BlogCommendFromBaidu-1.control
打包的web项目在使用webView的时候需要注意，目前好像大部分主流webview插件都不支持web端使用webview，如果一定要使用，可以使用以下方案：
1.url_lanuch插件，这个插件默认可以打开浏览器，在网页端，将会新开一个页面打开输入的页面
2.HtmlElementView，这个是web插件，支持html和url加载，似乎有很多限制，使用可以参考一下两篇文章
关于在Flutter Web中加载html
Flutter Web 加载html的填坑记录
3.easy_web_view亲测有效打开速度流畅 支持多端打开webview、html、markdown

*打开已有项目进入到根目录，执行flutter create .开始创建web目录文件，执行完毕后，在项目中多了个一个web目录
*需要有lib/mian.dart作为主要的入口
安装flutter_web编译工具           新版本估计不需要了，1.9版本之后有新的变动，合并了flutter_web
flutter pub global activate webdev  
*执行flutter build web  打包
*编译完成后, 进入web目录: ** 项目根目录/build/web** , 运行服务python -m http.server 9999
*浏览器输入：127.0.0.1:9999




#插件开发相关的                参考  fluttertoast: ^7.1.1 项目，可以外部编写js代码调试完直接引入   FluttertoastWebPlugin
编写插件：MyWebPlugin
注入插件：再pubspec.yaml中添加插件
              flutter:
                plugin:
                  platforms:
                    web:
                      pluginClass: MyWebPlugin
                      fileName: plugins/MyWebPlugin.dart
调用插件：MethodChannelPage

#错误合集
## flutter XMLHttpRequest error.
浏览器跨域问题，在服务器添加 c.Header("Access-Control-Allow-Origin", "*")


todo
    查看图片详情，打开新的图片页面去查看的
    多个文件上传到服务器
