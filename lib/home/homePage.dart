import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/animationDemo/home.dart';
//import 'package:url_launcher/url_launcher.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key key,
    this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState(title: title);
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin{
  int _currentIndex = 0;

  String title;

  _MyHomePageState({this.title : 'flutter demo'});


  void _showMessageDialog(String message){
    showDialog(
        context: context,
        child: new AlertDialog(
          title: new Text('温馨提示'),
          content: new Text(message),
          actions: <Widget>[
            new FlatButton(
              child: new Text("OK"),
              onPressed: () {
                Navigator.pop(context);
                _launchURL('https://www.baidu.com');
              },
            ),
            new FlatButton(
              child: new Text("CANCEL"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        )
    );
  }

  _launchURL(url) {
//    if (canLaunch(url) != null) {
//       launch(url,
//           forceWebView:true,
//       forceSafariVC: false);
//    } else {
//      throw 'Could not launch $url';
//    }
  }

  @override
  void dispose() {
    print('回收');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(_currentIndex);
    return new DefaultTabController(
        length: 4,
        child : new Scaffold(
          drawer: new Drawer(
            child: new Center(
              child: new FlatButton(
                child: new CircleAvatar(
                  child: new Icon(Icons.add),
                ),
                onPressed: (){
                  Navigator.pop(context);
                },
              ),
            ),
            elevation: 100.0,
          ),
          appBar: new AppBar(
            title: new Text(title),
            bottom: new TabBar(
                tabs: [
                    new Tab(text: '动画页面'),
                    new Tab(text: '第一页面'),
                    new Tab(text: '第二页面'),
                    new Tab(text: '第三页面'),
                  ],
            ),
          ),
          body: new TabBarView(
              children: [
                new AnimationDemoHome(),
                new Icon(Icons.directions_car),
                new Icon(Icons.directions_transit),
                new Icon(Icons.directions_bike),
              ],
            controller: new TabController(length: 3, vsync: this,initialIndex: _currentIndex),
          ),
          bottomNavigationBar: new BottomNavigationBar(
            currentIndex: _currentIndex,
            items: <BottomNavigationBarItem>[
              new BottomNavigationBarItem(
                  icon: new Icon(Icons.directions_car),
                  title: new Text('第一页面')),
              new BottomNavigationBarItem(
                  icon: new Icon(Icons.directions_transit),
                  title: new Text('第二页面')),
              new BottomNavigationBarItem(
                  icon: new Icon(Icons.directions_bike),
                  title: new Text('第三页面')),
            ],
            onTap: (int index) {
              setState(() {
                _currentIndex = index;
                print('点击:$_currentIndex');
              });
            },
          ),
          floatingActionButton:
          new Builder(builder: (BuildContext context){
            return new FloatingActionButton(onPressed: (){
              print('点击了');
              Scaffold.of(context).showSnackBar(
                  new SnackBar(content: new Row(
                      children: <Widget>[
                        new FlatButton(
                          child: new Text("OK"),
                          onPressed: () {
                            _showMessageDialog('点击了OK 了');
                          },
                        ),
                        new FlatButton(
                          child: new Text("CANCEL"),
                          onPressed: () {
                            Navigator.of(context).push(new PageRouteBuilder(
                              opaque: false,
                              pageBuilder: (BuildContext context,_,__){
                                return new AnimationDemoHome();
                              },
                              transitionsBuilder: (_,Animation<double> animation,__,Widget child){
                                return new FadeTransition(
                                  opacity: animation,
                                  child: new SlideTransition(position: new Tween<Offset>(
                                      begin: const Offset(0.0, 1.0),
                                      end: Offset.zero,
                                  ).animate(animation),child: child),
                                );
                              }
                            ));
                          },
                        ),
                      ] ,
                    mainAxisAlignment:MainAxisAlignment.end,
                  ))
              );
            },
            child: new Icon(Icons.add),);
          }),
        )
    );
  }

}