import 'package:flutter/material.dart';
import './views/firstPage.dart';
import './views/secondPage.dart';
import './views/thirdPage.dart';
import './compontents/movies.dart';

void main() => runApp(
    new MaterialApp(
      title: '首页',
      home: new MyHomePage(),
    ));

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{

  TabController controller;

  @override
  void initState() {
    controller = new TabController(vsync: this, length: 4);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new TabBarView(
        controller: controller,
        children: <Widget>[
          new FirstPage(),
          new SecondPage(),
          new ThirdPage(),
          new MoviesViewList(),
        ]
      ),
      bottomNavigationBar: new Material(
        color: Colors.lightBlue,
        child: new TabBar(
          controller: controller,
          tabs:<Tab>[
              new Tab(text: '列表', icon: new Icon(Icons.home)),
              new Tab(text: '通知', icon: new Icon(Icons.message)),
              new Tab(text: '我的', icon: new Icon(Icons.cloud)),
              new Tab(text: '电影', icon: new Icon(Icons.movie)),
            ]
        )
      )
    );
  }
}
