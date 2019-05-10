import 'dart:convert' show json;
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../http/user.dart';
import '../compontents/movies.dart';
class FourPage extends StatefulWidget {
  @override
  FourPageState createState() => FourPageState();
}
class FourPageState extends State<FourPage> {
  var moviesList;
  @override
  _getdouban() async {
    Dio dio = new Dio();
    Response  response1;
    var data = {
      "start":25,
      "count":25
    };
    response1 = await dio.get("http://api.douban.com/v2/movie/top250",data:data);
    print("我喜欢的电影标题：${response1.data['subjects'][0]['title']}");
    Map<String, dynamic> userMap= response1.data;
    var result = new MoviesList.fromJson(userMap);
    print('We sent the verification link to ${result.total}.');
    setState(() {
      moviesList = result;
    });
  }
  @override
  Widget build(BuildContext context) {
    return new Container(
      height:600,
      width:500,
      child:new Column(
        children:<Widget> [
          new Text('电影大推送'),
          new RaisedButton(
            onPressed: _getdouban,
            child: new Text('刷新')
          ),
          new MoviesViewList()
        ]
      )
    );
  }
}