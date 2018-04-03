import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/animationDemo/home.dart';
import 'package:flutter_demo/home/homePage.dart';
import 'package:flutter_demo/routes/Path.dart';

class APP extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: buildMyHomePage(),
      routes: <String,WidgetBuilder>{
        RoutePath.ANIMATION_DEMO_PAGE:(BuildContext context){return new AnimationDemoHome(); }//先声明要跳转的新页面,title是要传递的参数,'/second_page'是给这个页面取个名字，后面会用到
      },
    );
  }
  MyHomePage buildMyHomePage() => new MyHomePage(title: 'Flutter Demo ');
}