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

class BodyPageState extends State<BodyPage>
{

  int index=1;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _getWidget(index),
        RaisedButton(onPressed: (){
          setState(() {
            index=2;
          });
        })
      ],
    );
  }

  Widget _getWidget(int index)
  {
    if(index==1)
    {
//      return SecondPage(Colors.blue,key: UniqueKey(),);
      return  FirstPage(Colors.blue);
    }
    else
    {
//      return SecondPage(Colors.deepPurple,key: UniqueKey(),);
      return SecondPage(Colors.deepPurple);
    }

  }

}


class FirstPage extends StatefulWidget
{
  FirstPage(this.color,{Key key}):super(key:key);
  final Color color;
  @override
  State<StatefulWidget> createState() {
    return FirstPageState();
  }
}

class FirstPageState extends State<FirstPage>
{
  int index=10;
  @override
  Widget build(BuildContext context) {
    //runtimeType就是Widget的名字，这里就是SecondPage
    print("FirstPage  build....index:$index....runtimeType:${widget.runtimeType.toString()}");
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
        child: Text("点击"),
      ),
    );
  }

  @override
  void initState() {
    print("FirstPage initState........");
    super.initState();
  }

  @override
  void didChangeDependencies() {
    print("FirstPage didChangeDependencies........");
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(FirstPage oldWidget) {
    print("FirstPage didUpdateWidget........");
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    print("FirstPage dispose........");
    super.dispose();
  }

  @override
  void deactivate() {
    print("FirstPage deactivate........");
    super.deactivate();
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
    print("SecondPage build....index:$index....runtimeType:${widget.runtimeType.toString()}");
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
        child: Text("点击"),
      ),
    );
  }

  @override
  void initState() {
    print("SecondPage initState........");
    super.initState();
  }

  @override
  void didChangeDependencies() {
    print("SecondPage didChangeDependencies........");
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(SecondPage oldWidget) {
    print("SecondPage didUpdateWidget........");
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    print("SecondPage dispose........");
    super.dispose();
  }

  @override
  void deactivate() {
    print("SecondPage deactivate........");
    super.deactivate();
  }
}