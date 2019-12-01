import 'dart:async';
import 'dart:core';

import 'package:flutter/material.dart';

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
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("验证State生命周期"),
        ),
        body: Builder(builder: (context){
          return Container(
            child: BodyPage(),
          );
        }),
      ),
    );
  }
}

class BodyPage extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    return BodyPageState();
  }
}

class PrintWidget extends StatefulWidget
{
  PrintWidget({Key key}):super(key:key);
  @override
  State<StatefulWidget> createState() {
    return PrintWidgetState();
  }

}

class PrintWidgetState extends State<PrintWidget>
{
  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Text(record),
    );
  }

}

class BodyPageState extends State<BodyPage>
{

  int index=1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 1,
            child: Column(
              children: <Widget>[
                _getWidget(index),
                RaisedButton(onPressed: (){
                  setState(() {
                    index=2;
                  });
                },
                  child: Text("切换Widget"),
                
                ),

                RaisedButton(onPressed: (){
                  setState(() {
                    record="日志记录:\n";
                  });
                },
                  child: Text("清空日志"),
                )
              ],
            )),
        Expanded(child:PrintWidget() ),
      ],
    );
  }

  Widget _getWidget(int index)
  {
    if(index==1)
    {
//      return SecondPage(Colors.blue,key: UniqueKey(),);
      return  SecondPage(Colors.blue);
    }
    else
    {
//      return SecondPage(Colors.deepPurple,key: UniqueKey(),);
      return SecondPage(Colors.deepPurple);
    }

  }

}


class SecondPage extends StatefulWidget
{
  SecondPage(this.color,{Key key}):super(key:key);
  final Color color;
  @override
  State<StatefulWidget> createState() {
    return SecondPageState();
  }
}

class SecondPageState extends State<SecondPage>
{
  int index=10;
  @override
  Widget build(BuildContext context) {
    //runtimeType就是Widget的名字，这里就是SecondPage
    print("build....index:$index....runtimeType:${widget.runtimeType.toString()}");
    return Container(
      width: 100,
      height: 100,
      color: widget.color,
      child: InkWell(
        onTap: (){
          setState(() {
            index=20;
          });
        },
        child: Center(
          child: Text("点击将10变为20"),
        ),
      ),
    );
  }

  @override
  void initState() {
    print("initState........");
    super.initState();
  }

  @override
  void didChangeDependencies() {
    print("didChangeDependencies........");
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(SecondPage oldWidget) {
    print("didUpdateWidget........");
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    print("dispose........");
    super.dispose();
  }

  @override
  void deactivate() {
    print("deactivate........");
    super.deactivate();
  }
}