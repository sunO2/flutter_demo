import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';

class IconTab extends StatefulWidget{

  final Text text;

  final Icon icon;

  IconTab({ @required this.text,@required this.icon});

  @override
  State<StatefulWidget> createState() => new _IconTabState(text:text,icon:icon);
}

class _IconTabState extends State{

  final Text text;

  final Icon icon;

  _IconTabState({ @required this.text,@required this.icon});

  @override
  Widget build(BuildContext context) {

    var column = new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
      icon,
      text
    ],);


    return new SizedBox(
      height: 60.0,
      child: new Center(
          child: column,
          heightFactor:1.0
      ),
    );

  }

}
