import 'package:flutter/src/scheduler/ticker.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/app/widget/home/jianbaoBar.dart';
import 'package:flutter_demo/app/widget/home/jiandingPage.dart';
import 'package:flutter_demo/app/widget/home/mePage.dart';
import 'package:flutter_demo/app/widget/home/shequPage.dart';
import 'package:flutter_demo/app/widget/home/startPage.dart';

class APPHome extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => new _APPHomeState();

}
class _APPHomeState extends State with TickerProviderStateMixin{

  List<Widget> _BottomNavigationBarView = <Widget>[
    new StartPage(),
    new JianBaoPage(),
    new SheQuPage(),
    new JianDingPage(),
    new MePage(),
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
      length: 5,
      initialIndex: _currentIndex,
      child: new Scaffold(
        body: _BottomNavigationBarView[_currentIndex],
        bottomNavigationBar: new BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          fixedColor:Theme.of(context).primaryColor,
          currentIndex: _currentIndex,
          items: _BottomNavigationBarItems,
          onTap: (int index){
            setState((){
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }


  //页面的 按钮
  List<BottomNavigationBarItem> _BottomNavigationBarItems = <BottomNavigationBarItem>[
    new BottomNavigationBarItem(icon: new Icon(Icons.airline_seat_flat), title: new Text('首页')),
    new BottomNavigationBarItem(icon: new Icon(Icons.airline_seat_flat_angled), title: new Text('鉴宝')),
    new BottomNavigationBarItem(icon: new Icon(Icons.airline_seat_individual_suite), title: new Text('社区')),
    new BottomNavigationBarItem(icon: new Icon(Icons.airline_seat_legroom_normal), title: new Text('鉴定')),
    new BottomNavigationBarItem(icon: new Icon(Icons.airline_seat_recline_extra), title: new Text('我的')),
  ];



}