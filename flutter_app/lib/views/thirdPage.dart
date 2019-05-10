import 'package:flutter/material.dart';

class ThirdPage extends StatefulWidget {
  @override
  ThirdPageState createState() => new ThirdPageState();
}

class ThirdPageState extends State<ThirdPage> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
//        appBar: new AppBar(
//          title: new Text('界面三'),
//        ),
        body: new Container(
            child: new ThirdPageComponent()
        )
    );
  }
}
class ThirdPageComponent extends StatelessWidget {
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
                    color: Colors.lightBlue,
//            height: 120.0,
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
                    child: (
                        Column(
                            children:<Widget>[
                              Row(
                                  children:[
                                    Padding(
                                    //padding: const EdgeInsets.all(10.0),
                                      padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 40.0),
                                    ),
                                   //圆形
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
                                                    color: Colors.black54,
                                                    fontSize: 18.0,
                                                    // fontStyle: FontStyle.italic,
                                                    // letterSpacing: 5.0,
                                                    // wordSpacing: 8.0,
                                                    // textBaseline: TextBaseline.ideographic,
                                                    //  decoration: TextDecoration.lineThrough,
                                                    //  decorationStyle: TextDecorationStyle.wavy,
                                                    fontWeight: FontWeight.w800,
                                                    inherit: true,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                  padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 5.0),
                                                  child:Text('签名档：努力敲代码中...', style:TextStyle( fontSize:14, color:Color(0xff8e6f02 )))
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
                    padding: EdgeInsets.fromLTRB(0,5,0,20),
                    child:(
                        Column(
                            children:[
                              // 支付组件
                              PayComponent(),
                              Container(
                                  padding: const EdgeInsets.all(12.0),
                                  margin: EdgeInsets.fromLTRB(0,10,0,0),
                                  color:Colors.white,
                                  child:
                                  Column(
                                  children:[
                                  // 相册
                                  new Container(
                                    decoration: new BoxDecoration(
                                        border:new Border(
                                            bottom: new BorderSide(width: 0.5,color:const Color(0xff999999))
                                          // color:const Color(0xff6d9eeb),
                                        )
                                    ),
                                    child:Flex(
                                        direction: Axis.horizontal,
                                        //    主轴排列（start、end、center、spaceBetween、spaceAround、spaceEvenly）
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        // 交叉轴
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                              padding:EdgeInsets.only(bottom:15),
                                              child:(
                                                  Row(
                                                      children:[
                                                        Container(
                                                            margin:EdgeInsets.only(right:8),
                                                            child: Icon(Icons.collections, color:Colors.deepOrangeAccent)
                                                        ),
                                                        Text('收藏',style:TextStyle(color:Colors.blue,fontSize:18.0)),
                                                      ]
                                                  )
                                              )
                                          ),
                                          Icon(Icons.chevron_right, color:Colors.lightBlue)
                                        ]
                                    ),
                                  ),
                                  new Container(
                                    padding:EdgeInsets.symmetric(vertical:15),
                                    decoration: new BoxDecoration(
                                        border:new Border(
                                            bottom: new BorderSide(width: 0.5,color:const Color(0xff999999))
                                          // color:const Color(0xff6d9eeb),
                                        )
                                    ),
                                    child:Flex(
                                        direction: Axis.horizontal,
                                        //    主轴排列（start、end、center、spaceBetween、spaceAround、spaceEvenly）
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        // 交叉轴
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                              child:(
                                                  Row(
                                                      children:[
                                                        Container(
                                                            margin:EdgeInsets.only(right:8),
                                                            child: Icon(Icons.picture_in_picture, color:Colors.indigo)
                                                        ),
                                                        Text('相册',style:TextStyle(color:Colors.blue,fontSize:18.0)),
                                                      ]
                                                  )
                                              )
                                          ),
                                          Icon(Icons.chevron_right, color:Colors.lightBlue)
                                        ]
                                    ),
                                  ),
                                  MyPageItem(title:'布朗熊'),
                                  MyPageItem(title:'小青蛙'),
                                  MyPageItem(title:'小白兔')
                                 ]
                                )
                              ),
                            ]
                        )
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
// 主轴排列（start、end、center、spaceBetween、spaceAround、spaceEvenly）
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
// 交叉轴
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
class MyPageItem extends StatefulWidget {
  MyPageItem({Key key, this.title,this.icon}) : super(key: key);

  final String title;
  final String icon;
  @override
  MyPageItemState createState() => MyPageItemState();
}
class MyPageItemState extends State<MyPageItem> {
  String title = 'xx';
  void initState() {
//     TODO: implement initState
    title = widget.title;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:EdgeInsets.symmetric(vertical:15),
      decoration: new BoxDecoration(
        border: new Border(
          bottom: new BorderSide(width:0.5, color: const Color(0xff999999)),
        ),
      ),
      child:Flex(
          direction: Axis.horizontal,
          //  主轴排列（start、end、center、spaceBetween、spaceAround、spaceEvenly）
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //  交叉轴
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
                child:(
                    Row(
                        children:[
                          Container(
                              margin:EdgeInsets.only(right:8),
                              child: Icon(Icons.card_giftcard, color:Colors.deepOrangeAccent)
                          ),
                          Text(title,style:TextStyle(color:Colors.blue,fontSize:18.0)),
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