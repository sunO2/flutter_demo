import 'package:flutter/material.dart';

void main()=> runApp(new MyApp());

final String SECOND_PAGE = '/second_page';

class MyApp extends StatelessWidget {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(

      home: new MyHomePage(title: 'Flutter Demo '),
      routes: <String,WidgetBuilder>{
        SECOND_PAGE:(BuildContext context){return new MyHomePage(title: '第二个页面'); }//先声明要跳转的新页面,title是要传递的参数,'/second_page'是给这个页面取个名字，后面会用到
      },
    );
  }
}

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

class _MyHomePageState extends State<MyHomePage> {
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
                Navigator.of(context).pushNamed(SECOND_PAGE);
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
                    new Tab(text: '第一页面'),
                    new Tab(text: '第二页面'),
                    new Tab(text: '第三页面'),
                  ],
            ),
          ),
          body: new TabBarView(
              children: [
                new Icon(Icons.directions_car),
                new Icon(Icons.directions_transit),
                new Icon(Icons.directions_bike),
              ]
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
                            Navigator.of(context).pushNamed(SECOND_PAGE);
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
