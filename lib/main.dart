import 'dart:async';

import 'package:flutter/material.dart';

import 'LifeCycle/life_cycle_main.dart';

GlobalKey _formKey= new GlobalKey<PrintWidgetState>();
String record="日志记录：\n";
void main() {
  FlutterError.onError = (FlutterErrorDetails details) {
    //reportErrorAndLog(details);
  };
  runZoned(
        () => runApp(MyApp()),
    zoneSpecification: ZoneSpecification(
      print: (Zone self, ZoneDelegate parent, Zone zone, String line) {
        collectLog(line); // 收集日志
      },
    ),
    onError: (Object obj, StackTrace stack) {
      //var details = makeDetails(obj, stack);
      //reportErrorAndLog(details);
    },
  );
}



void collectLog(String line){
  //print("zone");
  //会死循环，本来就是监听print的
  //print("unused error handler");
  record=record+line+"\n";
  if(_formKey.currentState!=null)
  {
    _formKey.currentState.setState((){});
  }
}



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter 最佳实践',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: '最佳实践'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),

      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
                onPressed: (){

                },
              child: Text("State 生命周期一"),
            ),
          ],
        ),
      ),
    );
  }
}
