import 'package:Vietnamese_and_Flutter_Educamp/E3_Random.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'consts.dart';
import 'e1_Image.dart';
import 'e2_Card.dart';
import 'e4_Audio.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Learn Flutter & explore the Vietnamese language.',
      theme: ThemeData(
        //primarySwatch: kHDIPrimaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        brightness: Brightness.dark,
        backgroundColor: kHDIBGColor,
        primaryColor: kHDIPrimaryColor,
        fontFamily: 'Fira Sans ExtraCondensed',
      ),
      //home: HomePage(),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/${HDIRoutes.E1}': (context) => E1_ImageDisplay(),
        '/${HDIRoutes.E2}': (context) => E2_Card(),
        '/${HDIRoutes.E3}': (context) => E3_Random(),
        '/${HDIRoutes.E4}': (context) => E4_TonalsPage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Learn Flutter & Vietnamese'),
      ),
      body: Center(
        child: GridView.count(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          // mainAxisAlignment: MainAxisAlignment.start,
          padding: EdgeInsets.all(5),
          shrinkWrap: true,
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: [
            HDIButton(
              text: '1. Display an Image',
              onPressed: () {
                Navigator.pushNamed(context, '/${HDIRoutes.E1}');
              },
            ),
            HDIButton(
              text: '2. Laying out Cards',
              onPressed: () {
                Navigator.pushNamed(context, '/${HDIRoutes.E2}');
              },
            ),
            HDIButton(
              text: '3. Random with Math',
              onPressed: () {
                Navigator.pushNamed(context, '/${HDIRoutes.E3}');
              },
            ),
            HDIButton(
              text: '4. Turn on the sound',
              onPressed: () {
                Navigator.pushNamed(context, '/${HDIRoutes.E4}');
              },
            ),
            HDIButton(
              text: '5. Data Structure',
              onPressed: null,
            ),
            HDIButton(
              text: '6. Multi Page and Custom Widgets',
              onPressed: null,
            ),
            HDIButton(
              text: '7. Working with API',
              onPressed: null,
            ),
            HDIButton(
              text: '8. Data on the Cloud!',
              onPressed: null,
            ),
            HDIButton(
              text: '9. Time for To-Do!',
              onPressed: null,
            ),
          ],
        ),
      ),
    );
  }
}

class HDIButton extends StatelessWidget {
  final Function onPressed;
  String text;

  HDIButton({@required this.onPressed, @required this.text});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text(text),
      color: kHDIBGColor,
      onPressed: onPressed,
    );
  }
}
