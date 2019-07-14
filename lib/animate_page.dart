import 'package:flutter/material.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';
///StatefulWidget与基础组件
class AnimatePage extends StatefulWidget {
  @override
  _AnimatePageState createState() => _AnimatePageState();
}
class AnimatedLogo extends AnimatedWidget{
  AnimatedLogo({Key key,Animation<double> animation})
  :super(key:key,listenable:animation);
  Widget build(BuildContext context){
    final Animation<double> animation = listenable;
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        height: animation.value,
        width: animation.value,
        child: FlutterLogo(),
      ),
    );
  }
}
class _AnimatePageState extends State<AnimatePage> with SingleTickerProviderStateMixin{
 Animation<double> animation;
 AnimationController controller;
/* AnimationStatus animationStatus;
 double animationValue;*/
  @override
  void initState() {
    // TODO: implement deactivate
    super.initState();
    controller = AnimationController(vsync: this,duration:Duration(seconds: 2));
    animation = Tween<double>(begin: 0,end: 300).animate(controller);
    controller.forward();
    /*..addListener((){
      setState(() {
        animationValue = animation.value;
      });

    })
    ..addStatusListener((AnimationStatus state){
      setState(() {
        animationStatus = state;
      });
    });*/
  }
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(fontSize: 20);
    // TODO: implement build
    return AnimatedLogo(animation: animation);
    /*return MaterialApp(
      title: 'Logo app',
      theme: ThemeData(
          primarySwatch: Colors.blue
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text('Logo app'),
            leading: GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back),
            ),
          ),
          body:Container(
           *//* child: Column(
              children: <Widget>[
                GestureDetector(
                  onTap: (){
                    controller.reset();
                    controller.forward();
                  },
                  child: Text('start',textDirection: TextDirection.rtl,),
                ),
                Text('start:'+animationStatus.toString(),
                textDirection: TextDirection.rtl),
                Text('Value:'+animationValue.toString(),
                    textDirection: TextDirection.rtl),
                Container(
                  height: animation.value,
                  width: animation.value,
                  child: FlutterLogo(),
                )
              ],
            ),*//*
          )
      ),
    );*/
  }
}