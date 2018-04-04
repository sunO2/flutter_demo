import 'package:flutter/material.dart';


class SheQuPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _SheQuPage();
}

class _SheQuPage extends State{
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: new Text("社区")
      ),
    );
  }
  
} 