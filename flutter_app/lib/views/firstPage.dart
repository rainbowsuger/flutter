import 'package:flutter/material.dart';
import '../compontents/list.dart';
import '../compontents/swiper.dart';
import 'package:flutter_app/compontents/swiper.dart';
class FirstPage extends StatefulWidget {
  @override
  FirstPageState createState() => new FirstPageState();
}

class FirstPageState extends State<FirstPage> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
//      appBar: new AppBar(
//        title: new Text('轮播图'),
//      ),
//    body: new CustomScrollView(
//      shrinkWrap: true,
//      // 内容
//      slivers: <Widget>[
//        new SliverPadding(
//          padding: const EdgeInsets.all(20.0),
//          sliver: new SliverList(
//            delegate: new SliverChildListDelegate(
//              <Widget>[
//               new SizedBox(
//                height:800,
//                child: new List(),
//              ),
//              new SizedBox(
//                height:800,
//                child:new SwiperView(),
//              ),
//              ],
//            ),
//          ),
//        ),
//      ],
//    )
      body: new CustomScrollView(
          shrinkWrap: true,
          // 内容
          slivers: <Widget>[
            new SliverPadding(
                padding: const EdgeInsets.all(20.0),
                sliver: new SliverList(
                  delegate: new SliverChildListDelegate(
                    <Widget>[
                      new SizedBox(
                        height: 600,
                        child: new SwiperView(),
                      ),
                      new Container(
                        padding: EdgeInsets.all(10.0),
                        child: new Text(
                          '苹果(约680g/3个)',
                          style: new TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600,
                          )
                        ),
                      ),
                      new Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: new Text(
                            '￥26.8',
                            style: new TextStyle(
                              color: Colors.red,
                              fontSize: 16.0,
                            )
                        ),
                      ),
                      new SizedBox(
                        height: 800,
                        child: new List(),
                      ),
                    ],
                  ),
                )
            )
          ]
      ),
    );
  }
}