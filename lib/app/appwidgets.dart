
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

abstract class APPState extends State{

  //页面跳转
  void navigator({
    @required BuildContext context,
    @required Widget widgets}){

    Navigator.of(context).push(new PageRouteBuilder(
        opaque: false,
        pageBuilder: (BuildContext context, _, __) {
          return widgets;
        },
        transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
          return new FadeTransition(
            opacity: animation,
            child: new SlideTransition(
                position: new Tween<Offset>(
              begin: const Offset(1.0, 0.0),
              end: Offset.zero,
            ).animate(animation), child: child),
          );
        }
    ));
  }
}