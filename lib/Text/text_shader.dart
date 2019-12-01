import 'package:flutter/material.dart';


class TextShader extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Text Shader"),
      ),
      body: Builder(builder: (context){
        return Container(
          //margin: EdgeInsets.only(top: 100),
          child: Text(
            "哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈",
            maxLines: 1,
            overflow: TextOverflow.fade,
            textDirection: TextDirection.ltr,
            style: TextStyle(color: Colors.blue,fontSize: 50),
            //必须设置这个值
            softWrap: false,
          ),
        );
      }),
    );
  }
}