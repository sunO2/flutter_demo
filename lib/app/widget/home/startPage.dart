import 'dart:async';
import 'dart:convert';
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

  List<Map<String,String>> data;

  @override
  void initState() {
    super.initState();
    getBanner();
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
            appNavigator(context: context, widgets: new AnimationDemoHome());
          },
        ),
        actions: <Widget>[
          new IconButton(
              icon: new Icon(Icons.message),
              onPressed: (){
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

  List<Map<String,String>> getBanners(){
    if(null == data || data.isEmpty){
      return new List();
    }
    return data;
  }


  List<Widget> getChild(List<Map<String,String>> images){
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

    var jsonDecoder = new JsonDecoder();
    List<Map<String,String>> convert = jsonDecoder.convert(read);
    print(convert);

    setState((){
      this.data = convert;
    });
  }
}