import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red[900],
          title: Text('1. Image Banner') ,
        ),
        body: Center(
          child: Image(
            image: AssetImage('assets/poster.jpg'),
            //repeat: ImageRepeat.repeatY,
          ),
        ),
        backgroundColor: Colors.brown[900],
      )
    );
  }
}

