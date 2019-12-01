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
            child: FilterChip(
              //Chip—might cause call to saveLayer() if disabledColorAlpha != 0xff
              disabledColor: Color.fromARGB(255, 20, 20, 20),
              avatar: CircleAvatar(
                backgroundColor: Colors.grey.shade800,
                child: Text('AB'),
              ),
              label: Text('Aaron Burr'),
            ),
          );
        }),
      ),
    );
  }
}