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
          return LogoFade();
        }),
      ),
    );
  }
}


class LogoFade extends StatefulWidget {
  @override
  createState() => LogoFadeState();
}

class LogoFadeState extends State<LogoFade> {
  double opacityLevel = 1.0;

  void _changeOpacity() {
    setState(() => opacityLevel = opacityLevel == 0 ? 1.0 : 0.0);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedOpacity(
          opacity: opacityLevel,
          duration: Duration(seconds: 3),
          child: FlutterLogo(),
        ),
        RaisedButton(
          child: Text('Fade Logo'),
          onPressed: _changeOpacity,
        ),
      ],
    );
  }
}