import 'package:flutter/material.dart';

class JianBaoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _JianBaoPage();
}

class _JianBaoPage extends State{

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          centerTitle: true,
          title: new Text("鉴宝")
      ),
    );
  }

}