import 'package:flutter/material.dart';
import 'package:flutter_demo/app/appwidgets.dart';

String URL = 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1522838775724&di=166d2b89c4ab34b237d6d118c4d0e24c&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fimage%2Fc0%253Dshijue1%252C0%252C0%252C294%252C40%2Fsign%3Dcfb53f93c3177f3e0439f44e18a651b2%2F6609c93d70cf3bc7814060c9db00baa1cd112a56.jpg';

class MainScreen extends APPStatelessWidget {
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Main Screen')
      ),
      body: new GestureDetector(
        onTap: (){
          navigatorDefaule(context: context, widgets: new DetailScreen());
        },
        child: new Hero(
          tag: 'imageHero',
          child: new Image.network(
            URL,
          )
        )
      )
    );
  }
}

class DetailScreen extends APPStatelessWidget {
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      body: new GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: new Center(
          child: new Hero(
            tag: 'imageHero',
            child: new Image.network(URL)
          )
        )
      )
    );
  }
}