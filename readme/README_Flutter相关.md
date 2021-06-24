#Flutter四种工程类型
##Flutter工程中，通常有以下几种工程类型，下面分别简单概述下：
##1. Flutter Application
##标准的Flutter App工程，包含标准的Dart层与Native平台层
##2. Flutter Module
##Flutter组件工程，仅包含Dart层实现，Native平台层子工程为通过Flutter自动生成的隐藏工程
##3. Flutter Plugin
##Flutter平台插件工程，包含Dart层与Native平台层的实现
##引用方式
##    上传到Pub site，这是一个类似Maven的Dart仓库。
##    上传到Git，通过Git引用
##    本地文件引用
##4. Flutter Package
##Flutter纯Dart插件工程，仅包含Dart层的实现，往往定义少量公共Widget


官方文档：https://flutter.cn/desktop#writing-a-plugin


#Flutter引入到原生项目中
方式一：
以Android Archive (AAR)形式引入Flutter依赖。
方式二：
一种方式是将Flutter作为module，然后native主工程将其引入进来。
这种方式适合参与人数比较少的项目，如果有多人协作开发的大型项目就不合适了，因为其他人首先要配置Flutter开发环境，而且团队里面其他人还要配置module的依赖，都要熟悉flutter，成本相对较高点。
2020年03月30日  新版Flutter集成到已有Android项目的实现
一、创建Flutter Module
在已有Android工程中集成flutter，可以使用AndroidStudio的new Flutter Module实现，方便快捷。
找到FlutterModule,选择地址为android项目地址根目录
创建完成后我们的项目中会多一个叫做flutter的module
并且在项目的setting.gradle文件中会自动添加如下几行代码，
```
setBinding(new Binding([gradle:this]))
evaluate(
  new File(
    settingsDir,
    'flutter_module/.android/include_flutter.groovy'
  )
)
include ':flutter_module'
```
最后我们只需在app的build.gradle中引用这个flutter模块即可
```
implementation project(path: ':flutter')
```



#测试
##flutter run test/widget_test.dart

#插件介绍
```
connectivity 0.4.9+2                        #网络状态监听的
hive: ^1.4.4                                #关系型数据库
logger: ^0.9.4                              #日志管理
device_preview                              #在不同分辨率的手机上查看UI效果
geolocator 6.1.14                           #地址定位            
share 0.6.5+4                               #分享功能            
https://pub.flutter-io.cn/packages/image    #各种格式图片加载PNG / Animated APNGJPEGTargaGIF / Animated GIFPVR(PVRTC)ICO    
auto_size_text 2.1.0                        #自动改变文字大小
flutter_inner_drawer 0.5.7+2                #侧滑 
google_fonts 1.1.2                          #集合了许多字体
```



#屏幕适配
屏幕适配框架 ScreenUtil 蓝湖对应的尺寸直接指定到ScreenUtil.instance = ScreenUtil(width: 378, height: 815)..init(context); 对于尺寸，直接输入即可，，
使用android double iconSize = ScreenUtil().setWidth(24); double textSize = ScreenUtil().setSp(10);


#●隐藏状态栏
引入'package:flutter/services.dart',   SystemChrome.setEnabledSystemUIOverlays([]); //隐藏 SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);//恢复
可以通过 MediaQuery.of(context).padding.top  获取状态栏高度


#控制状态栏导航栏颜色
```
  // 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
  SystemUiOverlayStyle systemUiOverlayStyle =
  SystemUiOverlayStyle(statusBarColor: Colors.transparent);
  SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
//在run app 地方要先设置android状态栏为透明的沉浸
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: widget.getSystemNavigationBarColor(),//导航栏颜色
        systemNavigationBarDividerColor: null,
        statusBarColor: widget.getStatusBarColor(),//最顶部状态栏颜色
        systemNavigationBarIconBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: widgets,
          ),
        ),
      ),
    );
```



//特别的
//移除顶部的padding 意思是图片可以全屏
child: new MediaQuery.removePadding(
          removeTop: true,
          context: context,
          child: ListView.builder(
            itemCount: _dataSource.length,
            itemBuilder: (BuildContext context, int index){
              return Material(
                color: Colors.green,
                child: ListTile(
                  title: Text(_dataSource[index]),
                ),
              );
            },
          ),
        ),



#必须使用TickerProviderStateMixin代替SingleTickerProviderStateMixin才能多次动画  MyDashBoardWidget 仪表盘例子


#Flutter页面状态的保持
AutomaticKeepAliveClientMixin这个Mixin就是Flutter为了保持页面设置的。哪个页面需要保持页面状态，就在这个页面进行混入。

不过使用使用这个Mixin是有几个先决条件的：

使用的页面必须是StatefulWidget,如果是StatelessWidget是没办法办法使用的。
其实只有两个前置组件才能保持页面状态：PageView和IndexedStack。
重写wantKeepAlive方法，如果不重写也是实现不了的




#控件学习
父布局提供约束，子布局显示大小
父布局不限制大小，子布局默认设置为0

控件的布局学习
http://www.cocoachina.com/articles/26120

# Column是不可滚动的部件，如果子控件超出屏幕，需要加上滚动的,外部用Expanded包裹
# Column  设置最小高度   mainAxisSize: MainAxisSize.min,
```
Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: widget.getWidgets(),
                ),
              ),
            )
          ]
          Column 设置：mainAxisSize: MainAxisSize.min，配合Align(alignment:Alignment.center实现定位
Column(mainAxisSize: MainAxisSize.min,children: [
              Align(alignment:Alignment.centerLeft,child: SimpleText("1"),),
              Align(alignment:Alignment.center,child: SimpleText("1"),),
              Align(alignment:Alignment.centerRight,child: SimpleText("1"),),
            ],),


```

#Sliver   家族
#SliverAppBar       SliverAppBar 往往做为 CustomScrollView 的第一个子元素，根据滚动控件的偏移量或者浮动的位置来改变 SliverAppBar 的高度。
#SliverPadding      为 Sliver 系列控件添加一个 padding 。如给上面 SliverAppBar 添加一个 Padding 。
#SliverGrid         多行多列的列表控件，相当于 Android 的 GridView，有两个属性
                    delegate
                        SliverChildDelegate，这里有两种方式创建
                            SliverChildListDelegate 一般用来构 item 不多的列表，效率更低。
                            SliverChildBuilderDelegate 一般用来构 item 更多的列表，效率更高。
                    gridDelegate
                        SliverGridDelegate，也是有两种方式创建
                            SliverGridDelegateWithMaxCrossAxisExtent，根据给的 maxCrossAxisExtent 最大宽度自动分配一列展示多少个。
                            SliverGridDelegateWithFixedCrossAxisCount，固定展示多少列。
#SliverList         类似的

#SliverFixedExtentList  比 SliverList 多一个 itemExtent 属性，设置 item 的高度 。item 里面的子控件无法再改动高度。

#SliverPersistentHeader 上面 SliverAppBar 就是结合 SliverPersistentHeader 实现的效果，
                        SliverPersistentHeader 需要一个 SliverPersistentHeaderDelegate 。
                        实现 SliverPersistentHeaderDelegate 有 4 个方法需要重写

#SliverToBoxAdapter     有一个 Widget 属性，主要作用是在 CustomScrollView 里面添加多种不同布局的样式。
#SliverFillViewport     占满一屏或者比一屏更多的布局，
#SliverFillRemaining    滑动剩余部分展示的布局


#滚动
#ListWheelScrollView    滚轮效果的listview
#PageView               可以滚动整个屏幕的PageView组件
#ReorderableListView    支持拖拉排序
#FixedExtentScrollController    监听的类，可以指定初始位置
ListView等上下缓冲的大小一般指的是缓冲视图的大小，大概是三分之一的屏幕，也可以用过cacheExtent来指定大小，单位像素
列表优化
    指定itemExtent，来确定每个布局大小



#动画
    可以通过Ticker自己定义每一帧
#素材动画框架
#Flare动画控件，Rive，Lottie
#AnimatedList                   带动画效果的列表
#AnimatedOpacity                AnimatedOpacity实现渐变效果
#AnimatedIcon                   动画图标
#AnimatedPositioned             Positioned 的动画版。只有是 Stack 的 child 时才能工作。    如果 child 的 size 在动画过程会改变，则 AnimatedPositioned 是很好的选择
#AnimatedPadding                在 Widget 和屏幕边框之间提供平滑缓冲区和空格的好方法。使用此选项可动态更改 Widget 的填充，并使其在两个值之间设置动画。
#AnimatedCrossFade              交叉淡入本是电影术语，意指一要素渐进淡入另一要素。若 Flutter widget 也有类似功能不是实用吗？ 这方面，AnimatedCrossFade 就是解决方案。
#TweenAnimationBuilder          过渡动画
#AnimatedContainer              改变Container的属性时候，就会有动画效果
#AnimatedSwitcher               改变child的时候，就会有动画效果    如果是不同的控件，是需要标脏数据 key: UniqueKey(),
#AnimatedBuilder                AnimatedBuilder是用于构建动画的widget
#Hero动画                       页面共享元素动画
    尺寸可变的按钮               用AnimatedContainer和AnimatedBuilder配合
AlignTransition:http://laomengit.com/flutter/widgets/AlignTransition/
AnimatedAlign：http://laomengit.com/flutter/widgets/AnimatedAlign/
AnimatedCrossFade：http://laomengit.com/flutter/widgets/AnimatedCrossFade/
AnimatedPositionedDirectional：http://laomengit.com/flutter/widgets/AnimatedPositionedDirectional/
DecoratedBoxTransition：http://laomengit.com/flutter/widgets/DecoratedBoxTransition/
DefaultTextStyleTransition：http://laomengit.com/flutter/widgets/DefaultTextStyleTransition/
AnimatedDefaultTextStyle：http://laomengit.com/flutter/widgets/AnimatedDefaultTextStyle/
PositionedTransition：http://laomengit.com/flutter/widgets/PositionedTransition/
RelativePositionedTransition：http://laomengit.com/flutter/widgets/RelativePositionedTransition/
RotationTransition：http://laomengit.com/flutter/widgets/RotationTransition/
ScaleTransition：http://laomengit.com/flutter/widgets/ScaleTransition/
SizeTransition：http://laomengit.com/flutter/widgets/SizeTransition/
SlideTransition：http://laomengit.com/flutter/widgets/SlideTransition/
FadeTransition：http://laomengit.com/flutter/widgets/FadeTransition/
AnimatedModalBarrier：http://laomengit.com/flutter/widgets/AnimatedModalBarrier/







#InheritedModel                 可以让内部的widget访问外部的widget
#FadeinImage                    指定assets图片作为本地图片占位符，再加载网络图片
#Tooltip                        点击后提示出信息
#InheritedWidget                传递数据
#Placeholder                    加载前的布局，可以和listview配合使用
#ReorderableListView            可以在listview中，长按移动
#Semantics                      添加语义
#ColorFiltered                  改变控件颜色
#SnackBar                       提示控件
#ShaderMask                     ShaderMask可以让我们将Shader用于任何一个控件上，比如在Text上使用渐变就可以使用ShaderMask来实现
#DropdownButton                 下拉框
#PopupMenuButton                弹出一个菜单供用户选择
#TextField                      文本输入框
#InteractiveViewer              放大缩小的控件
#SwitchListTile                 带标题的选择器
#Location                       获取地址
#layoutBuilder                  获取上级传递给下级的约束
#Constants                      一个属性，可以设置约束
#flutter_slidable               滑动获取更多的



    var isEnable = await location.serviceEnabled()
    if (isEnable){
        await location.requestService()
    }
#device_info                    获取设备信息
#ImageFiltered                  可以直接改变图形，平移，旋转，高斯模糊,性能会比BackdropFilter
```
TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(0),//文本居中显示
                    border: OutlineInputBorder(),
                    hintText: '请输入appId',
                    labelStyle: TextStyle(
                      fontSize: 14.sp,
                    ),
                  ),
                ),
```


#SelectableText                 您是否曾经想过要使应用程序中的一些文本可被选择呢? SelectableText 正是适合您的 widget！
#ListTile                       基于Material Design 模式的列表项
#Spacer                         用于撑起Row和Column剩余空间
#Silder                         刻度尺
#DraggableScrollableSheet       您是否想将小部件拖到屏幕上? 小部件是否具有可滚动的内容? DraggableScrollableSheet 可以帮助您！
#Drawer                         抽屉
#ListWheelScrollView            ListWheelScrollView和ListView同源，但它的渲染效果类似于车轮（或者滚筒），它不是在平面上滑动，而是转动车轮
#Inkwell                        水波纹效果
#Ink                            给上一级的Material上色
#LinearGradient（线性渐变）
#RadialGradient （放射渐变）
#SweepGradient（扫描渐变）
```
    //只有添加了点击事件opTap，属性才会生效

    InkWell(
     customBorder: StadiumBorder(),可以裁剪下水波纹边框
          mouseCursor: MaterialStateProperty.resolveAs<MouseCursor>(//如果是web，鼠标悬停时候，鼠标状态改为可点击
              MaterialStateMouseCursor.clickable, Set()),
          hoverColor: Colors.greenAccent,
          child: Text("${title}"),
        )
```

#SizedBox                       设置具体尺寸,SizedBox组件是一个特定大小的盒子，这个组件强制它的child有特定的宽度和高度。如果宽度或高度为null，则此组件将调整自身大小以匹配该维度中child的大小。）
#ConstrainedBox                 (限定最大最小宽高布局)尺寸限制类容器ConstrainedBox学习
#OverflowBox                    对其子项施加不同约束的widget，它可能允许子项溢出父级
#LimitedBox                     当父布局不约束子布局大小的时候，LimitedBox才会为其子级提供默认大小，如果父布局有约束大小，LimitedBox的属性无效
#FractionallySizedBox           Flutter FractionallySizedBox 设置维度比例 而不是固定的px  百分比布局
#SizedOverflowBox               子组件在超出SizedOverflowBox指定的宽高时，不会隐藏，依然进行绘制
#AspectRatio                    长宽比例布局     aspectRatio:3/2； 表示的是宽度与高度的比例3:2
#Align                          确定布局的位置，让子布局自己确定位置
#Expanded                       强制子布局充满
#IndexedStack                   IndexedStack在同一时刻只能显示子控件中的一个控件，通过Index属性来设置显示的控件
#Stack                          类似Frayment  通过Positioned指定位置    通过overflow可以指定是否要绘制到外部
#ListView                       列表
#Container                      容器
#Row和Colum
    MainAxisSize：　　控制自己的布局方式
    　　MainAxisSize.min　　默认值，Column和Row自适应children；
    　　MainAxisSize.max　　Column填充父控件竖屏，Row填充父控件横屏；需要搭配MainAxisAlignment使用才有效果；


    MainAxisAlignment：　　控制子集的对齐方式，Column上下对齐，Row左右对齐
    　　MainAxisAlignment.start　　默认值，Column靠上，Row靠左；
    　　MainAxisAlignment.center　　Column,Row居中；
    　　MainAxisAlignment.end　　Column靠下，Row靠右；
    　　MainAxisAlignment.spaceAround　　自己填充，等份分配空间给子集，子集各自居中对齐；
    　　MainAxisAlignment.spaceBetween　　自己填充，等份分配空间给子集，子集两侧对齐；
    　　MainAxisAlignment.spaceEvenly　　自己填充，等份分配空间给子集，子集同一中线居中对齐；
    　　注：当设置MainAxisSize.max时才该值有效果。


    CrossAxisAlignment：　　　控制子集各自的对齐方式，Column左右对齐，Row上下对齐
    　　CrossAxisAlignment.strech       　Column中会使子控件宽度调到最大，Row则使子控件高度调到最大
    　　CrossAxisAlignment.start　　　   Column中会使子控件向左对齐，Row中会使子控件向上对齐
    　　CrossAxisAlignment.center　　　默认值，子控件居中
    　　CrossAxisAlignment.end　　　　Column中会使子控件向右对齐，Row中会使子控件向下对齐
    　　CrossAxisAlignment.baseline　　按文本水平线对齐。与TextBaseline搭配使用


    TextBaseline：
    　　TextBaseline.alphabetic　　  用于对齐字母字符底部的水平线。
    　　TextBaseline.ideographic　　用于对齐表意字符的水平线。


    VerticalDirection：　　控制子控件对齐方式是否相反方式
    　　VerticalDirection.down　　默认值，按照默认方式
    　　VerticalDirection.up　　　CrossAxisAlignment.start跟CrossAxisAlignment.end对反



#DataTable                      您是否有一些重要数据要以表格的方式显示给用户？使用 DataTable 定义列，行并自动调整单元格大小！
#WidgetsBindingObserver         可以监测app当前的界面状态

#TabBar
```
/**
    const TabBar({
    Key key,
    @required this.tabs,//显示的标签内容，一般使用Tab对象,也可以是其他的Widget
    this.controller,//TabController对象
    this.isScrollable = false,//是否可滚动
    this.indicatorColor,//指示器颜色
    this.indicatorWeight = 2.0,//指示器高度
    this.indicatorPadding = EdgeInsets.zero,//底部指示器的Padding
    this.indicator,//指示器decoration，例如边框等
    this.indicatorSize,//指示器大小计算方式，TabBarIndicatorSize.label跟文字等宽,TabBarIndicatorSize.tab跟每个tab等宽
    this.labelColor,//选中label颜色
    this.labelStyle,//选中label的Style
    this.labelPadding,//每个label的padding值
    this.unselectedLabelColor,//未选中label颜色
    this.unselectedLabelStyle,//未选中label的Style
    }) : assert(tabs != null),
    assert(isScrollable != null),
    assert(indicator != null || (indicatorWeight != null && indicatorWeight > 0.0)),
    assert(indicator != null || (indicatorPadding != null)),
    super(key: key);
 */
```



#UI 中的异步
runOnUiThread 在 Flutter 中对应什么方法？
Dart 是单线程执行模型、支持 Isolate（一种多线程模型）、事件循环和异步编程的。除非使用 Isolate，不然你的 Dart
代码都是在 UI 线程中进行并由事件循环器进行驱动。
例如你可以在 UI 线程执行网络请求而不会导致 UI 线程的阻塞：
loadData() async {
  String dataURL = "https://jsonplaceholder.typicode.com/posts";
  http.Response response = await http.get(dataURL);
  setState(() {
    widgets = JSON.decode(response.body);
  });
}
通过调用 setState 方法触发界面的重新构建来刷新并更新数据。

在这种情况下，Flutter 中还是有和 AsyncTask 类似的解决方案。在 Flutter 中可以利用 CPU 多核的性质来并行处理事务，而这一工作则是由 Isolate 完成。
Isolate 是独立的执行线程，和主线程不共享任何内存。这意味着你不能在 Isolate 中给主线程的变量赋值或者调用 setState 方法来更新 UI。
catchError  捕获异步任务的错误
whenComplete 完成时候调用


线程
在foundation库中封装了一个轻量级compute操作，
//必须要带参数,必须要static
  static Future<dynamic> waitTimeDown(int i) async{
    for(int _connectDeviceTimerCount=0;_connectDeviceTimerCount<5;_connectDeviceTimerCount++){
      LogUtils.e("循环");
      sleep(Duration(seconds: 1));
    }
    return 1;
  }
调用
ShowDialogUtils().showLoading(mBuildContext);
await compute(waitTimeDown,0);
ShowDialogUtils().disLoading();



每个Isolate都有EventLoop
事件循环 EventLoop
事件队列 EventQueue
细小队列 Microtask Queue
    级别比EventQueue更高，如果有Microtask Queue，会先处理Microtask Queue事件，然后再处理EventQueue的队列




#Key
1.LocalKey
    LocalKey子类包含ValueKey/ObjectKey/UniqueKey
    ValueKey顾名思义是比较的是值
    ObjectKey顾名思义是比较对象的key:官方显示比较类型，当类型不一致，判定为不是通过一个对象，如果另外一个也是ObjectKey,则判断地址是否相同，只有地址相同才判定为同一个对象。
    UniqueKey每次生成不同的值，当我们每次刷新都需要一个新的值，那么正是这个存在的意义。
GlobalKey & GlobalObjectKey
作为全局使用的key,当跨小部件我们通常可以使用GlobalKey来刷新其他小部件。

2.GlobalObjectKey和ObjectKey是否相等的判定条件是一致的，
GlobalObjectKey继承GlobalKey,通过GlobalKey<T extends State<StatefulWidget>>来指定继承state，
并实现StatefulWidget接口的类，然后可以通过GlobalKey.currentState来获取当前state,
然后调用state.setState((){})完成当前小部件标记为dirty，在下一帧刷新当前小部件。
