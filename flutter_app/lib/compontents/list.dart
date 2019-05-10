import 'package:flutter/material.dart';
//支付
class List extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
       return new Card(
        child: new Container(
          padding: const EdgeInsets.all(12.0),
          margin: EdgeInsets.only(top: 10, bottom:5),
          color:Colors.white,
          child:
          Flex(
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
                    child: Icon(Icons.payment, color:Colors.green)
                  ),
                  Text('支付',style:TextStyle(color:Colors.blue,fontSize:18.0)),
                  ]
                  )
                )
                ),
                Icon(Icons.chevron_right, color:Colors.lightBlue)
            ]
          )
        )
       );
     }
    );
  }
}