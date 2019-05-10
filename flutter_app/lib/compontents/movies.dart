import 'dart:convert' show json;
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../http/user.dart';

class MoviesViewList extends StatefulWidget {
  @override
  MoviesViewState createState() => MoviesViewState();
}

class MoviesViewState extends State<MoviesViewList> {
  var moviesList ;

  @override
  void initState() {
    setState(() {
//      moviesList = new MoviesList.fromJson(temp);
      moviesList = _getdouban();
    });

  }
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
    return new ListView.builder(
        itemCount: moviesList.count,
        itemBuilder: (BuildContext context, int index) {
          return new Container(
//            alignment: Alignment.topLeft,
              color:Color(0xff7a4f06),
              padding:EdgeInsets.all(10.0),
              child: new Card(
                  elevation:5.0,
                  child: new Column(
                      children:[
                        Text("电影名称：《${moviesList.subjects[index]["title"]}》",style:TextStyle(fontSize: 18,)),
                        Text("原名：《${moviesList.subjects[index]["original_title"]}》",style:TextStyle(fontSize: 18,)),
                        Text("评分：${moviesList.subjects[index]["rating"]["average"]}",style:TextStyle(fontSize: 18,color:Color(0xff7a4f06))),
                        Text("电影类型：${moviesList.subjects[index]["genres"]}",style:TextStyle(fontSize: 18,)),
                        Text("上映时间：${moviesList.subjects[index]["year"]}",style:TextStyle(fontSize: 18,)),
                        Text("主演:${moviesList.subjects[index]["casts"][0]["name"]}",style:TextStyle(fontSize: 18,)),
                        Image.network(
                            moviesList.subjects[index]["images"]["small"],
                            fit: BoxFit.contain
                        ),

                      ]
                  )
              )

          );
        }
    );
  }

}