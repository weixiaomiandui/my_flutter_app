import 'package:flutter/material.dart';

///StatefulWidget与基础组件
class StatefulGroup extends StatefulWidget {
  @override
  _StatefulGroupState createState() => _StatefulGroupState();
}
class _StatefulGroupState extends State<StatefulGroup>{
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
                        'http://www.devio.org/img/avatar.png',
                        width: 100,
                        height: 100,
                      )
                    ],
                  ),
                )
              ],
            ),
            onRefresh: __handleRefresh
        ):Text('列表'),
      ),
    );
  }
  Future<Null>__handleRefresh() async {
    await Future.delayed(Duration(milliseconds: 100));
    return null;
  }
}