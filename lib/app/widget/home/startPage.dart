import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'package:flutter_demo/routes/Path.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_demo/animationDemo/home.dart';
import 'package:flutter_demo/app/appwidgets.dart';
import 'package:flutter_demo/hero/MainScreen.dart';


class StartPage extends  StatefulWidget{
  @override
  State<StatefulWidget> createState() => new _StartPage();
}

class _StartPage extends APPState{

  static List data;

  @override
  void initState() {
    super.initState();

    if(null == data) {
      print("数据是否为空  $data");
      getBanner();
    }
  }

  @override
  Widget build(BuildContext context) {
    print('重新布局');
    return new Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        leading: new IconButton(//左边按钮
          icon:new Icon(Icons.search),
          color: Colors.white,
          onPressed: (){
            print('点击');
//            appNavigator(context: context, widgets: new AnimationDemoHome());
            Navigator.pushNamed(context, RoutePath.ANIMATION_DEMO_PAGE);

          },
        ),
        actions: <Widget>[
          new IconButton(
              icon: new Icon(Icons.message),
              onPressed: (){
//                Navigator.pushNamed(context, RoutePath.ANIMATION_DEMO_PAGE);
                appNavigator(context: context, widgets: new MainScreen());
              })
        ],
        title: new Text("首页")
      ),
      body: new SizedBox(
        height: 192.0,
        child: new TabBarView(children:getChild(getBanners()))
        ),
      );
  }

  List getBanners(){
    if(null == data || data.isEmpty){
      return new List();
    }
    return data;
  }


  List<Widget> getChild(List images){
    if(null == images || images.isEmpty){
     return <Widget>[new Text('')];
    }
    List<Widget> iamgeWidgets = new List();
    images.forEach((image){
      iamgeWidgets.add(new Image.network(
          image['img'],
        fit: BoxFit.fitWidth,
      ));
    });


    return iamgeWidgets;
  }

  void getBanner() async{
    var read = await http.read('http://aworld.cn/api/app/home/banners');

    print(read);

    var convert = json.decode(read);
    print(convert[0].runtimeType);

    setState((){
      _StartPage.data = convert;
    });
  }
}