import 'package:flutter/material.dart';

//https://xotours.vn/blog/planning-a-trip-to-vietnam/

class PageImageDisplay extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('A Proud Vietnamese Learning Flutter'),
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
