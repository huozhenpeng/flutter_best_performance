import 'package:flutter/material.dart';


class OpacityWidget extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(builder: (context){
        return LogoFade();
      }),
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
        Text("Container(color: Color.fromRGBO(255, 0, 0, 0.5)) is much faster than Opacity(opacity: 0.5, child: Container(color: Colors.red))."),
        Text("Opacity就是控制显示隐藏的，完全可以用AnimatedOpacity替代"),

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