import 'package:flutter/material.dart';


class MePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _MePage();
}

class _MePage extends State{

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: new Text("我的")
      ),
    );
  }
  
} 