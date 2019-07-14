import 'package:flutter/material.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';
///StatefulWidget与基础组件
class ImagePage extends StatefulWidget {
  @override
  _ImagePageState createState() => _ImagePageState();
}
class _ImagePageState extends State<ImagePage>{
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(fontSize: 20);
    // TODO: implement build
    return MaterialApp(
      title: 'state 基础组件',
      theme: ThemeData(
          primarySwatch: Colors.blue
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('基础布局组建'),
          leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (index){
              setState(() {
                _currentIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                      Icons.home
                  ),
                  activeIcon: Icon(
                    Icons.home,
                    color: Colors.grey,
                  ),
                  title: Text('首页')
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                      Icons.list
                  ),
                  activeIcon: Icon(
                    Icons.list,
                    color: Colors.blue,
                  ),
                  title: Text('列表')
              ),

            ]
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: null,
          child: Text('点我'),
        ),
        body:_currentIndex==0
            ? RefreshIndicator(
            child: ListView(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(color: Colors.white),
                  alignment: Alignment.center,
                  child: Column(
                    children: <Widget>[
                      Image.network(
                        'https://picsum.photos/250?image=9',
                        width: 100,
                        height: 100,
                      ),
                      Image(
                        width: 200,
                        height: 200,
                        image: AssetImage('images/avatar.png'),
                      ),
                     /* FutureBuilder(
                        future: _getLocalFile("Download/to.png"),
                        builder: (BuildContext context,AsyncSnapshot<File> snapshot){
                          return snapshot.data != null ? Image.file(snapshot.data) : Container();
                        },
                      ),*/
                    ],
                  ),
                )
              ],
            ),
            onRefresh: __handleRefresh
        ): Center(
          /* child: FadeInImage.assetNetwork(
                  placeholder: 'images/uploaing.gif',
                  image: 'http://www.devio.org/img/avatar.png'
              ),*/
          child: CachedNetworkImage(
            placeholder: (context,url) => new CircularProgressIndicator(),
              imageUrl: 'https://picsum.photos/250?image=9'
          ),
        )
      ),
    );
  }
  Future<Null>__handleRefresh() async {
    await Future.delayed(Duration(milliseconds: 100));
    return null;
  }
  Future<File> _getLocalFile(String filename) async {
    String dir = (await getExternalStorageDirectory()).path;
    File f = new File('$dir/$filename');
    return f;
  }
  _item(String title, Color color) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(color: color),
      child: Text(
        title,
        style: TextStyle(fontSize: 22, color: Colors.white),
      ),
    );
  }
}