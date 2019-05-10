import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';    // 引入头文件


class SwiperView extends StatefulWidget {
  @override
  _SwiperViewState createState() => _SwiperViewState();
}

class _SwiperViewState extends State<SwiperView> {
  // 声明一个list，存放image Widget
  List<Widget> imageList = List();
  List<Widget> imageList2 = List();

  @override
  void initState() {
    imageList
      ..add(Image.network(
        'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=2726034926,4129010873&fm=26&gp=0.jpg',
        fit: BoxFit.fill,
      ))
      ..add(Image.network(
        'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3485348007,2192172119&fm=26&gp=0.jpg',
        fit: BoxFit.fill,
      ))
      ..add(Image.network(
        'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2594792439,969125047&fm=26&gp=0.jpg',
        fit: BoxFit.fill,
      ))
      ..add(Image.network(
        'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=190488632,3936347730&fm=26&gp=0.jpg',
        fit: BoxFit.fill,
      ));
    imageList2
      ..add(Image.network(
        'https://img.yzcdn.cn/public_files/2017/10/24/e5a5a02309a41f9f5def56684808d9ae.jpeg',
        fit: BoxFit.fill,
      ))
      ..add(Image.network(
        'https://img.yzcdn.cn/public_files/2017/10/24/1791ba14088f9c2be8c610d0a6cc0f93.jpeg',
        fit: BoxFit.fill,
      ))
      ..add(Image.network(
        'https://img.yzcdn.cn/public_files/2017/10/24/2f9a36046449dafb8608e99990b3c205.jpeg',
        fit: BoxFit.fill,
      ))
      ..add(Image.network(
        'https://img.yzcdn.cn/public_files/2017/10/24/f6aabd6ac5521195e01e8e89ee9fc63f.jpeg',
        fit: BoxFit.fill,
      ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView(     // 这里使用listView是因为本地写了几组不同样式的展示，太懒了，所以这里就没有改
          children: <Widget>[
            firstSwiperView(),
            secondSwiperView()
          ],
        )
    );
  }
    Widget firstSwiperView() {
        return new Container(
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 2),
          width: MediaQuery.of(context).size.width,
          height:300,
          child: Swiper(
            itemCount: 4,
            itemBuilder:_swiperBuilder,
            pagination: SwiperPagination(
            alignment: Alignment.bottomRight,
            margin: const EdgeInsets.fromLTRB(0,0,20,10),
            builder: DotSwiperPaginationBuilder(
              color:Colors.black54,
              activeColor:Colors.orange
            )
            ),
            controller: SwiperController(),
            scrollDirection: Axis.vertical,
            autoplay:true,
            onTap: (index) => print('点击了第$index张图片')
          ),
        );
    }
  Widget _swiperBuilder(BuildContext context, int index) {
    return (imageList[index]);
  }
  Widget secondSwiperView() {
    return Container(
        padding: const EdgeInsets.fromLTRB(0, 50, 0, 5),
        width: 300,
        height: 300,
        child: new Swiper(
            layout: SwiperLayout.CUSTOM,
            customLayoutOption: new CustomLayoutOption(
                startIndex: -1,
                stateCount: 3
            ).addRotate([
              -45.0/180,
              0.0,
              45.0/180
            ]).addTranslate([ //偏移左右上下
              new Offset(-280.0, -40.0),
              new Offset(0.0, 0.0),
              new Offset(280.0, -40.0)
            ]),
            itemWidth: 220.0,
            itemHeight:400.0,
            itemBuilder: (context,index) {
              return new Container(
                  width:200,
                  height:250,
                  child: new Column(
                      children:[
                        new Text("$index"),
                        imageList2[index]
                      ]
                  )
              );
            },
            itemCount: 4,
            autoplay: true,
            viewportFraction: 0.5,
            scale: 0.5
        )
    );
  }
}


