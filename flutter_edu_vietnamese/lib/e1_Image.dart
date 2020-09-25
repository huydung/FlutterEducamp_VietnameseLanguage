import 'package:flutter/material.dart';

class E1_ImageDisplay extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('1. Vietnamese Language'),
      ),
      body: Center(
        child: Image(
          image: AssetImage('assets/poster.jpg'),
          //repeat: ImageRepeat.repeatY,
        ),
      ),
    );
  }
}
