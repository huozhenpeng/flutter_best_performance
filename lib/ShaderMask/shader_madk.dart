import 'package:flutter/material.dart';


class ShaderMaskWidget extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ShaderMask"),
      ),
      body: Builder(builder: (context){
        return Container(
          margin: EdgeInsets.only(top: 100),
          child: ShaderMask(
            shaderCallback: (Rect bounds) {
              return RadialGradient(
                center: Alignment.topLeft,
                radius: 1.0,
                colors: <Color>[Colors.yellow, Colors.deepOrange.shade900],
                tileMode: TileMode.mirror,
              ).createShader(bounds);
            },
            blendMode: BlendMode.srcIn,
            child: const Text('I’m burning the memories ,尽量不要使用'),
          ),
        );
      }),
    );
  }
}