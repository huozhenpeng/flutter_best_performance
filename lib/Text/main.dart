import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Builder(builder: (context){
          return Container(
            margin: EdgeInsets.only(top: 100),
            child: Text(
                "哈哈哈哈哈哈哈或123h",
              maxLines: 1,
              overflow: TextOverflow.fade,
              textDirection: TextDirection.ltr,
              style: TextStyle(color: Colors.blue,fontSize: 10),
            ),
          );
        }),
      ),
    );
  }
}