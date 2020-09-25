import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'consts.dart';

void main() {
  runApp(E3_Random());
}

class E3_Random extends StatelessWidget {
  static const String urlSpokenStat = 'https://www.ethnologue.com/language/vie';
  static const String urlPopularStat = 'https://www.visualcapitalist.com/100-most-spoken-languages/';
  static const String urlDifficultyStat = 'https://www.mustgo.com/worldlanguages/vietnamese/';

  _launchURL(String url) async {
    //const url = 'https://flutter.dev';
    if (await canLaunch(url) != null) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            fontFamily: 'Sources Sans Pro', brightness: Brightness.dark),
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: kHDIPrimaryColor,
            title: Text('2. Vietnamese Facts'),
          ),
          backgroundColor: Colors.blueGrey[900],
          body: SafeArea(
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/vietnamflag.png'),
                    ),
                    Text(
                      'Vietnamese Language',
                      style: TextStyle(
                          fontFamily: 'Fira Sans Extra Condensed',
                          color: Colors.white,
                          fontSize: 28),
                    ),
                    Divider(
                      color: Colors.blueGrey[200],
                      indent: 70,
                      endIndent: 70,
                      thickness: 0.2,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Card(
                      color: kHDIBGColor,
                      margin: EdgeInsets.symmetric(vertical: 3, horizontal: 40),
                      child: ListTile(
                        onTap: () => _launchURL(urlSpokenStat),
                        leading: Icon(Icons.people),
                        title: Text(
                          'Spoken by 77 million people',
                        ),
                      ),
                    ),
                    Card(
                      color: kHDIBGColor,
                      margin: EdgeInsets.symmetric(vertical: 3, horizontal: 40),
                      child: ListTile(
                        onTap: () => _launchURL(urlPopularStat),
                        leading: Icon(Icons.equalizer),
                        title: Text(
                          '#22 Most Popular Language',
                        ),
                      ),
                    ),
                    Card(
                      color: kHDIBGColor,
                      margin: EdgeInsets.symmetric(vertical: 3, horizontal: 40),
                      child: ListTile(
                        onTap: () => _launchURL(urlDifficultyStat),
                        leading: Icon(Icons.gesture),
                        title: Text(
                          'Difficulty Level: Rather Hard',
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        ));
  }
}
