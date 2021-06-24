到时候发布到这边GitHub Pages

Dart语法


mixin多继承
如果有多个相同的函数名，以最后一个mixin进来的类的函数为主



??
A??B
如果 A 等于 null，那么 A??B 为 B
如果 A 不等于 null，那么 A??B 为 A


list的map作用 可以把list对象操作后生成另一个list对象


dynamic  类似java的object

typedef FirstLoadingViewGroupSuccess =Widget Function(dynamic snapshot);    定义一个参数

#循环
```
 MyList.forEach((value) {
    print(value);
  });

for(int x=0;x<100;x++){
    int z=x%i;
    if(z==0){
      print(x);
    }
  }

List planetList = ["Mercury", "Venus", "Earth", "Mars"];

for (String planet in planetList) {
    print(planet);
}

int i=0;
  while(i<10){
    if(i%2==0){
      print(i);
    }
    i++;
  }

int i = 1;
	do {

		if ( i % 2 == 0) {
			print(i);
		}
		i++;
	} while ( i <= 10);
```


json的嵌套处理方式
Map toJson() {
    Map map = Map();
    map["titleTime"] = titleTime;
    map["items"] = items.map((item) => item.toJson()).toList();
    return map;
  }

外部jsonEncode(imageItemBeans)  处理下


json['data']  格式为  [保存数据库失败：Error 1062, 保存数据库失败：Error 1062, 保存数据库失败：Error 1062: Duplicate entry '1610032115199.png' for key 'image_models.PRIMARY']
class UpImageFileData{
  List<String> data = List<String>();
  @override
  fromJson(Map<String, dynamic> json) {
    String listStr = json['data'].toString();
    LogUtils.e("listStr:" + listStr);
    // String listStr = json['data'] as List;
    var scores = json['data'] as List<dynamic>;
    scores.forEach((element) {data.add(element.toString());});
  }

}


##使用的关键字是 async* sync* yield yield*
#有yield的地方，sync就要带*
```
main(List<String> arguments) {
  print(genList());// 0,1,2,3,4,5,6,7,8,9,10
  print(genList2());// 0,1,2,3,4,5,6,7,8,9,10
}

Iterable<int> genList({int max = 10}) sync* {
  var i = 0;
  while (i < max) {
    yield i;    //先返回i再继续执行下一步
    i++;
  }
}

Iterable<int> genList2({int max = 10}) {
  var list = <int>[];
  var i = 0;
  while (i < max) {
    list.add(i);
    i++;
  }
  return list.map((i) => i);
}
```