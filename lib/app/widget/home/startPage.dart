import 'package:flutter/material.dart';


class StartPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _StartPage();
}

class _StartPage extends State{
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        leading: new IconButton(
          icon:new Icon(Icons.search),
          color: Colors.white,
          onPressed: (){
            print('点击');
          },
        ),
        title: new Text("首页")
      ),
    );
  }
  
} 