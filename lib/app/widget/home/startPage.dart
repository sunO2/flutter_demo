import 'package:flutter/material.dart';
import 'package:flutter_demo/animationDemo/home.dart';
import 'package:flutter_demo/app/appwidgets.dart';
import 'package:flutter_demo/hero/MainScreen.dart';

class StartPage extends  StatefulWidget{
  @override
  State<StatefulWidget> createState() => new _StartPage();
}

class _StartPage extends APPState{

  @override
  Widget build(BuildContext context) {
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
      body: new Column(

      ),
    );
  }

}