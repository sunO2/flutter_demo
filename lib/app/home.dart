import 'dart:async';

import 'package:flutter/cupertino.dart';
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
    StartPage(),
    new JianBaoPage(),
    new SheQuPage(),
    new JianDingPage(),
    new MePage(),
  ];

  int _currentIndex = 0;

  TabController _tabController;

  @override
  void initState(){
    super.initState();
    print('initState ');

    _tabController = new TabController(
      initialIndex: _currentIndex,
        length: 5,
        vsync: this);
    _tabController.addListener((){
      setState((){
        print('切换');
        _currentIndex = _tabController.index;
      });
    });

  }

  @override
  Widget build(BuildContext context) {
    print('切换之后');
    return new DefaultTabController(
      length: 5,
      initialIndex: _currentIndex,
      child:new WillPopScope(
        // Prevent swipe popping of this page. Use explicit exit buttons only.
        onWillPop: () => new Future<bool>.value(true),
        child: new CupertinoTabScaffold(
          tabBar: new CupertinoTabBar(
            items: _BottomNavigationBarItems,
          ),
          tabBuilder: (BuildContext context, int index) {
            return new DefaultTextStyle(
              style: const TextStyle(
                fontFamily: '.SF UI Text',
                fontSize: 17.0,
                color: CupertinoColors.black,
              ),
              child: new CupertinoTabView(
                builder: (BuildContext context) {
                  return _BottomNavigationBarView[index];
                },
              ),
            );
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