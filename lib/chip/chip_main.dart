import 'package:flutter/material.dart';


class ChipWidget extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chip 控件"),
      ),
        body: Builder(builder: (context){
      return Container(
        child: Column(
          children: <Widget>[
            Text("Chip—might cause call to saveLayer() if disabledColorAlpha != 0xff"),
            Text("disabledColor: Color.fromARGB(255, 20, 20, 20)"),
            FilterChip(
              //Chip—might cause call to saveLayer() if disabledColorAlpha != 0xff
              disabledColor: Color.fromARGB(255, 20, 20, 20),
              avatar: CircleAvatar(
                backgroundColor: Colors.black26,
                child: Text('AB'),
              ),
              label: Text('Aaron Burr'),
            )
          ],
        ),
      );
    }
    )
    );
  }
}