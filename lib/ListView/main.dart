import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.


  @override
  Widget build(BuildContext context) {
    List<String> list=[];
    for(int i=0;i<100;i++)
      {
        list.add("当前item：$i");
      }
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("列表优化"),
        ),
        body: Builder(builder: (context){
          return Container(
            child: ListView.builder(
              cacheExtent: 50,
              itemCount: list.length,
                itemBuilder: (context,index){
                return ListTile(
                  title: Text(list[index]),
                );
            }),
          );
        }),
      ),
    );
  }
}