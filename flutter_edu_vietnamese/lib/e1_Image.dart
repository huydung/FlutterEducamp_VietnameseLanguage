import 'package:flutter/material.dart';


//import 'package:flutter_email_sender/flutter_email_sender.dart';
//
// void main() {
//   runApp(E1_ImageDisplay());
// }

class E1_ImageDisplay extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Banner'),
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
