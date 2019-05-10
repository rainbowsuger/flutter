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
            alignment: Alignment.topLeft,
            child: new Row(
              children:[
                new Text("演员:"),
                new ListView.builder(
                  itemCount: moviesList.subjects[index]["casts"].length,
                  itemBuilder: (BuildContext context, int index1) {
                    return new Column(
                      children: [
                      Text('姓名：${moviesList.subjects[index]["casts"][index1]["name"]}'),
                      Image.network(
                          moviesList.subjects[index]["casts"][index1]["name"],
                          fit: BoxFit.contain
                      ),
                      ]
                    );
                  }
                ),

                Image.network(
                    moviesList.subjects[index]["casts"],
                    fit: BoxFit.contain
                ),
                new Text("电影名称：${moviesList.subjects[index]["title"]}"),
                new Text("类型：${moviesList.subjects[index]["genres"]}"),
              ]
            )
          );
        }
    );
  }

}