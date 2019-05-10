import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(
    new MaterialApp(
      title: '页面跳转',
      home: new FirstPage(),
    ));

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
class MyApp1 extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Home Page'),
    );
  }
}
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  SecondPage createState() => SecondPage();
}

class SecondPage extends State<MyHomePage> {
  int _counter = 0;
  var isVisible = true;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isVisible ?
    Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: new SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '点击加号对数字进行+1',
                ),
                RandomWordsWidget(),
                Text(
                    "Hello flutter",
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 30.0,
                        color: Colors.yellow
                    )

                ),
                Image.network(
                  'https://img1.tuhu.org/tech/pic/FqlqfvFeHZft97lxGE6qiHy83Enb_w1024_h681.jpg',
                  fit: BoxFit.contain,
                  width: 150.0,
                  height: 100.0,
                ),
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(15.0),
                  margin: const EdgeInsets.all(15.0),
                  decoration: new BoxDecoration(
                    border: new Border.all(
                      color: Colors.red,
                    ),
                    image: const DecorationImage(
                        image: const NetworkImage(
                          'https://img1.tuhu.org/tech/pic/FqlqfvFeHZft97lxGE6qiHy83Enb_w1024_h681.jpg',
                        ),
                        fit: BoxFit.contain
                    ),
                    borderRadius: const BorderRadius.only(
                        topLeft: const Radius.circular(3.0),
                        topRight: const Radius.circular(6.0),
                        bottomLeft: const Radius.circular(9.0),
                        bottomRight: const Radius.circular(0.0)
                    ),
                  ),
                  child: Text(''),
                ),
                Flex(
                    direction: Axis.horizontal,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          width: 40.0,
                          height: 60.0,
                          color: Colors.pink,
                          child: const Center(
                              child: const Text("left")
                          )
                      ),
                      Container(
                          width: 80.0,
                          height: 60.0,
                          color: Colors.green,
                          child: const Center(
                              child: const Text("middle")
                          )
                      ),
                      Container(
                          width: 60.0,
                          height: 60.0,
                          color: Colors.orange,
                          child: const Center(
                              child: const Text("right")
                          )
                      )

                    ]
                ),
                Text(
                  '$_counter',
                  style: Theme
                      .of(context)
                      .textTheme
                      .display1,
                ),
                Flex(
                    direction: Axis.horizontal,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      new Flexible(
                          flex: 2,
                          fit: FlexFit.loose,
                          child: new Container(
                              color: Colors.blue,
                              height: 60.0,
                              alignment: Alignment.center,
                              child: const Text(
                                  'left',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.black),
                                  textDirection: TextDirection.ltr
                              )
                          )
                      ),
                      Flexible(
                          flex: 1,
                          fit: FlexFit.loose,
                          child: new Container(
                              color: Colors.red,
                              height: 60.0,
                              alignment: Alignment.center,
                              child: const Text(
                                  'right',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.black),
                                  textDirection: TextDirection.ltr
                              )
                          )

                      )

                    ]
                ),
                Container(
                  color: Colors.yellow,
                  height: 150.0,
                  alignment: Alignment.topLeft,
                  // positioned如果有前面的Container会根据前面的Container定位，不然会根据父元素container定位
                  child: Stack(children: <Widget>[
                    Positioned(
                        left: 40.0,
                        top: 80.0,
                        child: Container(
                          color: Colors.pink,
                          height: 50.0,
                          width: 100.0,
                          alignment: Alignment.center,
                          child: Text('Positioned'),
                        )
                    )
                  ]),
                ),
                Container(
                  color: Colors.yellow,
                  height: 150.0,
                  alignment: Alignment.topLeft,
                  // positioned如果有前面的Container会根据前面的Container定位，不然会根据父元素container定位
                  child: Stack(children: <Widget>[
                    new Container(
                      color: Colors.white,
                      height: 50.0,
                      width: 100.0,
                      alignment: Alignment.center,
                      child: Text("unPosition"),
                    )
                  ]),
                ),
                FlatButton(
                    color: Colors.blue,
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => new FirstPage()));
                    },
                    child: Text('跳转至第一页', style: TextStyle(color: Colors.white))
                ),
//                FlatButton(
//                    color: Colors.blue,
//                    onPressed: _incrementCounter,
//                    child: Icon(Icons.add),
//                ),
               FloatingActionButton(
                  onPressed: _incrementCounter,
                  tooltip: 'Increment',
                  child: new Icon(Icons.add),
                ),
              ]
            )
        )
    ):new Container();
  }
}
class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(brightness: Brightness.light,),//若有Appbar，应根据status的颜色选择brightness
      body: Center(
        child: Column(
//      mainAxisAlignment: MainAxisAlignment.center,
        children:<Widget>[
          Padding(
            padding: const EdgeInsets.all(12.0),
          ),
          Container(
            color: Color(0xFF69c6f8),
//            height: 120.0,
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
            child: (
                Column(
                  children:<Widget>[
                    Row(
                        children:[
                          Padding(
//                            padding: const EdgeInsets.all(10.0),
                            padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 40.0),
                          ),
//                          圆形
                          ClipOval(
                              child: Container(
                                  width: 75,
                                  height: 75,
                                  color: Colors.white,
                                  child: (
                                      Image.network(
                                          'https://img1.tuhu.org/tech/pic/Fv-FZ-z7swfrhXOCLYnE-pCyXLta_w1280_h1280.jpg',
                                          fit: BoxFit.contain
                                      )
                                  )
                              ),
                          ),
                         Container(
                           margin: EdgeInsets.symmetric(horizontal: 5, vertical: 0.0),
                           child:
                           Column(
                              children:[
                                Container(
                                  margin: EdgeInsets.only(right:60, top:10),
                                  child:
                                  Text(
                                    '郝思嘉同学',
                                    textAlign: TextAlign.left,
                                    style:
                                    TextStyle(
                                      color: Colors.black38,
                                      fontSize: 18.0,
        //                            fontStyle: FontStyle.italic,
      //                              letterSpacing: 5.0,
      //                              wordSpacing: 8.0,
        //                            textBaseline: TextBaseline.ideographic,
        //                            decoration: TextDecoration.lineThrough,
        //                            decorationStyle: TextDecorationStyle.wavy,
                                      fontWeight: FontWeight.w800,
                                      inherit: true,
                                    ),
                                  ),
                                ),
                                Container(
                                    padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 5.0),
                                    child:Text('签名档：努力敲代码中...', style:TextStyle( color:Color(0xffa57b18 )))
                                ),
                              ]
                           )

                         ),
                        ]
                    )

                  ]
                )

            )
          ),
          Container(
            width: double.infinity,
            color:Color(0xffeeeeeee),
            padding: EdgeInsets.fromLTRB(0,5,0,30),
            child:(
                Column(
                    children:[
//                      支付组件
                      PayComponent(),
                      Container(
                        padding: const EdgeInsets.all(12.0),
                        margin: EdgeInsets.fromLTRB(0,10,0,0),
                        color:Colors.white,
                        child:
                         Column(
                          children:[
//                            相册
                            MyPageItemsState(title: '相册'),
                          ]
                      )

                      ),
                    ]
                )
            )
          ),
          FlatButton(
              color: Colors.blue,
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => new MyApp()));
              },
              child: Text(
                '详情',
                style: TextStyle(color: Colors.white),
              )
          ),

      ])
      ),
    );
  }
}
//支付
class PayComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      margin: EdgeInsets.only(top: 10, bottom:5),
      color:Colors.white,
      child:
      Flex(
          direction: Axis.horizontal,
//                        主轴排列（start、end、center、spaceBetween、spaceAround、spaceEvenly）
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                        交叉轴
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
                child:(
                    Row(
                        children:[
                          Container(
                              margin:EdgeInsets.only(right:8),
                              child: Icon(Icons.payment, color:Colors.green)
                          ),
                          Text('支付',style:TextStyle(color:Colors.blue,fontSize:18.0)),
                        ]
                    )
                )
            ),
            Icon(Icons.chevron_right, color:Colors.lightBlue)
          ]
      ),
    );
  }
}
class MyPageItemsState extends StatefulWidget {
  MyPageItemsState({Key key, this.title}) : super(key: key);
  final String title;

  @override
  createState() => new MyPageItemsComponents();
}
class MyPageItemsComponents extends State<MyPageItemsState> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:EdgeInsets.symmetric(vertical:10),
      decoration: new BoxDecoration(
        border: new Border.all(
          color: Colors.grey,
        ),
      ),
      child:Flex(
          direction: Axis.horizontal,
//                                主轴排列（start、end、center、spaceBetween、spaceAround、spaceEvenly）
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                交叉轴
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
                child:(
                    Row(
                        children:[
                          Container(
                              margin:EdgeInsets.only(right:8),
                              child: Icon(Icons.collections, color:Colors.deepOrangeAccent)
                          ),
                          Text(widget.title,style:TextStyle(color:Colors.blue,fontSize:18.0)),
                        ]
                    )
                )
            ),
            Icon(Icons.chevron_right, color:Colors.lightBlue)
          ]
      ),
    );
  }
}


//自动生成随机字符串
class RandomWordsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 生成随机字符串
    final wordPair = new WordPair.random();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Text(wordPair.toString()),
    );
  }
}

