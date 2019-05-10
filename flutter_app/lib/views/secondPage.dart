import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../http/user.dart';
import 'package:flutter_html_textview/flutter_html_textview.dart';

class SecondPage extends StatefulWidget {
  SecondPage({Key key}) : super(key: key);

  @override
  SecondPageState createState() => new SecondPageState();
}

class SecondPageState extends State<SecondPage> {
  var _ipAddress = 'Unknown';
  var docName  = '我是一篇关于如何生活的文档';
  var docContent  = '我是一篇关于如何生活的文档';
  String html = '<div><p style="color:red;">Hello world! HTML5 rocks!</p><a href="https://www.baidu.com/">百度</a></div>';
  int docId  = 0;

  _getdouban() async {
    Dio dio = new Dio();
    Response response1;
    response1 = await dio.get("http://api.douban.com/v2/movie/top250?start=25&count=25");
    print(response1.data.toString());
  }
  _getIPAddress() async {
    var url = 'https://shop-gateway.tuhu.work/document/onlinecustomerservice/queryHistoryRecordDocByAccount';
    var httpClient = new HttpClient();

    String result;
    try {
      var request = await httpClient.postUrl(Uri.parse(url));
      var response = await request.close();
      if (response.statusCode == HttpStatus.ok) {
        var res = await response.transform(utf8.decoder).join();
        var data = json.decode(res);
        result = data['origin'];
      } else {
        result =
        'Error getting IP address:\nHttp status ${response.statusCode}';
      }
    } catch (exception) {
      result = 'Failed getting IP address';
    }

    // If the widget was removed from the tree while the message was in flight,
    // we want to discard the reply rather than calling setState to update our
    // non-existent appearance.
    if (!mounted) return;

    setState(() {
      _ipAddress = result;
    });
  }
  _getPrint() async{
    Dio dio = new Dio();
    Response response1,response2;
    response1 = await dio.get("https://shop-gateway.tuhu.work/document/article/show?docId=520");
    var a = {
      "name": "John Smith",
      "email": "john@example.com"
    };
    Map<String, dynamic> userMap= a;
//    var user = new User.fromJson(userMap);
//    print('Howdy, ${user.name}!');
    print('姓名, ${response1.data['message']}!');
//    print('We sent the verification link to ${user.email}.');
    print("拼接在地址上："+response1.data.toString());
// 请求参数也可以通过对象传递，上面的代码等同于：
     response2 = await dio.get('https://shop-gateway.tuhu.work/document/article/show',data:{"docId":"520"});
//    print("单独data："+response2.data.toString());
     print("单独data："+response2.data.toString());
    setState(() {
      docName = response2.data['data']['title'];
      docId = response1.data['data']['docId'];
      docContent = response1.data['data']['content'];
    });
  }
  @override
  Widget build(BuildContext context) {
    var spacer = new SizedBox(height: 32.0);

    return new Scaffold(
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text('Your current IP address is:'),
            new Text('$_ipAddress.'),
            new Text('文档id：$docId.'),
            new Text('文档名称：$docName.'),
            new HtmlTextView(data: html),
            new Container(
              height:300,
             child:
              new Text('文档内容：$docContent',
              style:
                TextStyle(
                  color: Colors.black54,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w800,
                )),
            ),
            new RaisedButton(
              onPressed: _getPrint,
              child: new Text('打印'),
            ),
            new RaisedButton(
              onPressed: _getdouban,
              child: new Text('豆瓣'),
            ),
            new RaisedButton(
              onPressed: _getIPAddress,
              child: new Text('Get IP address'),
            )
          ]
        ),
      ),
    );
  }
}