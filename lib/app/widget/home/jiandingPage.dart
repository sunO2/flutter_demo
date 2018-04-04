import 'package:flutter/material.dart';


class JianDingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _JianDingPage();
}

class _JianDingPage extends State{
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: new Text("鉴定")
      ),
    );
  }
  
} 