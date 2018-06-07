import 'dart:async';
import 'dart:convert';
import 'package:flutter_demo/routes/Path.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_demo/app/appwidgets.dart';
import 'package:flutter_demo/hero/MainScreen.dart';

class StartPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _StartPage();

//  @override
//  Widget build(BuildContext context) {
//    return new _StartPage().build(context);
//  }
}

class _StartPage extends APPState {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();

  static List data;

  @override
  void initState() {
    super.initState();

    if (null == data) {
      print("数据是否为空  $data");
      getBanner();
    }
  }

  @override
  Widget build(BuildContext context) {
    print('重新布局');
    return new Scaffold(
      key: _scaffoldKey,
      appBar: new AppBar(
          centerTitle: true,
          leading: new IconButton(
            //左边按钮
            icon: new Icon(Icons.search),
            color: Colors.white,
            onPressed: () {
              print('点击');
//            appNavigator(context: context, widgets: new AnimationDemoHome());
              Navigator.pushNamed(context, RoutePath.ANIMATION_DEMO_PAGE);
            },
          ),
          actions: <Widget>[
            new IconButton(
                icon: new Icon(Icons.message),
                onPressed: () {
//                Navigator.pushNamed(context, RoutePath.ANIMATION_DEMO_PAGE);
                  appNavigator(context: context, widgets: new MainScreen());
                })
          ],
          title: new Text("首页")),
      body: RefreshIndicator(
        key: _refreshIndicatorKey,
        onRefresh: _handleRefresh,
        child: new ListView.builder(
            itemCount: 4,
            padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
            itemBuilder: (context,index){
              if(index == 0){
                return new SizedBox(
                    height: 192.0,
                    child: TabBarView(children: getChild(getBanners()))
                );
              }else{
                return
                  FittedBox(
                    fit: BoxFit.contain,
                    child: const FlutterLogo(),
                );
              }
            })

       ,
      ),
    );
  }

  List getBanners() {
    if (null == data || data.isEmpty) {
      return new List();
    }
    return data;
  }

  List<Widget> getChild(List images) {
    if (null == images || images.isEmpty) {
      return <Widget>[new Text('')];
    }
    List<Widget> iamgeWidgets = new List();
    images.forEach((image) {
      Hero hero = new Hero(
        tag: "imageHero",
        child: new Card(
          child: new Image.network(
            image['img'],
            fit: BoxFit.fitWidth,
          ),
          elevation: 0.0,
          margin: EdgeInsets.all(10.0),
        ),
      );

      iamgeWidgets.add(GestureDetector(
        child: hero,
        onTap: () {
          navigatorDefaule(
              context: context,
              widgets: new DetailScreen(
                hero: hero,
                url: image["img"],
              ));
        },
      ));
    });

    return iamgeWidgets;
  }

  void getBanner() async {
    var read = await http.read('http://aworld.cn/api/app/home/banners');

    print(read);

    var convert = json.decode(read);
    print(convert[0].runtimeType);

    setState(() {
      _StartPage.data = convert;
    });
  }

  Future<Null> _handleRefresh() {
    final Completer<Null> completer = new Completer<Null>();
    new Timer(const Duration(seconds: 3), () {
      completer.complete(null);
    });
    return completer.future.then((_) {
      _scaffoldKey.currentState?.showSnackBar(new SnackBar(
          content: const Text('Refresh complete'),
          action: new SnackBarAction(
              label: 'RETRY',
              onPressed: () {
                _refreshIndicatorKey.currentState.show();
              })));
    });
  }

  void getClassPage(){

  }

}
