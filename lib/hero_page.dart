import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/scheduler.dart' show timeDilation;
///StatefulWidget与基础组件
class HeroPage extends StatefulWidget {
  @override
  _HeroPageState createState() => _HeroPageState();
}
class PhotoHero extends StatelessWidget{
  final String photo;
  final VoidCallback onTap;
  final double width;

  const PhotoHero({Key key, this.photo,this.onTap,this.width}):super(key:key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      width: width,
      child: Hero(
          tag: photo,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Image.network(
              photo,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}

class HeroAnimation extends StatelessWidget{
  Widget build(BuildContext context){
    timeDilation = 10.0;
    return Scaffold(
      appBar: AppBar(
        title: const Text('hero bar'),
      ),
      body: Center(
        child: PhotoHero(
          photo:'https://picsum.photos/250?image=9',
          width:300.0,
          onTap:(){
            Navigator.of(context).push(MaterialPageRoute(builder: (context){
              return Scaffold(
                appBar: AppBar(
                  title: const Text('Flippers page'),
                ),
                body: Container(
                  color: Colors.deepPurple,
                  padding: EdgeInsets.all(16),
                  alignment: Alignment.topLeft,
                  child: PhotoHero(
                    photo: 'https://picsum.photos/250?image=9',
                    width: 100,
                    onTap: (){
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              );
            }));

          }
        ),
      ),
    );
  }
}

class _HeroPageState extends State<HeroPage> with SingleTickerProviderStateMixin{
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
  }
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(fontSize: 20);
    // TODO: implement build
    return MaterialApp(
      home: HeroAnimation(),
    );
  }
}