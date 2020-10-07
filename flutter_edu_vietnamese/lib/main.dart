import 'package:flutter/material.dart';

import 'consts.dart';
import 'pages/e1_Image.dart';
import 'pages/e2_Card.dart';
import 'pages/e3_Random.dart';
import 'pages/e4_Audio.dart';
import 'pages/e5_Quizz.dart';
import 'pages/e6_CoupleMatchScore.dart';

//https://exchangeratesapi.io/

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Learn Flutter & explore the Vietnamese language.',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        //primarySwatch: kHDIPrimaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        brightness: Brightness.dark,
        backgroundColor: kHDIBGColor,
        canvasColor: Colors.blueGrey[900],
        primaryColor: kHDIPrimaryColor,
        fontFamily: 'Fira Sans ExtraCondensed',
      ),
      //home: HomePage(),
      initialRoute: kRoutes.HOME,
      routes: {
        kRoutes.HOME: (context) => HomePage(),
        kRoutes.E1_IMAGE: (context) => E1_ImageDisplay(),
        kRoutes.E2_BIZ_CARD: (context) => E2_Card(),
        kRoutes.E3_RANDOM_BANK_NOTE: (context) => E3_Random(),
        kRoutes.E4_SOUNDPAD: (context) => E4_TonalsPage(),
        kRoutes.E5_QUIZ: (context) => E5_QuizPage(),
        kRoutes.E6_COUPLE_MATCH: (context) => E6_CoupleMatch(),
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
              text: 'Hello there!',
              onPressed: () {
                Navigator.pushNamed(context, kRoutes.E1_IMAGE);
              },
            ),
            HDIButton(
              text: 'Vietnam Facts',
              onPressed: () {
                Navigator.pushNamed(context, kRoutes.E2_BIZ_CARD);
              },
            ),
            HDIButton(
              text: 'Vietnamese Bank Notes',
              onPressed: () {
                Navigator.pushNamed(context, kRoutes.E3_RANDOM_BANK_NOTE);
              },
            ),
            HDIButton(
              text: '6 tones in Vietnamese',
              onPressed: () {
                Navigator.pushNamed(context, kRoutes.E4_SOUNDPAD);
              },
            ),
            HDIButton(
              text: 'Vietnamese Dishes',
              onPressed: () {
                Navigator.pushNamed(context, kRoutes.E5_QUIZ);
              },
            ),
            HDIButton(
              text: 'Matching Couple?',
              onPressed: () {
                Navigator.pushNamed(context, kRoutes.E6_COUPLE_MATCH);
              },
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
