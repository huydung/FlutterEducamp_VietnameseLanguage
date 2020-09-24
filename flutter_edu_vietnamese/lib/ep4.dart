import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(VowelsApp());
}

class VowelsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        brightness: Brightness.dark,
      ),
      home: MyHomePage(title: 'Vietnamese Vowels'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> vowels = [
    'a',
    'ă',
    'â',
    'e',
    'ê',
    'i',
    'o',
    'ô',
    'ơ',
    'u',
    'ư',
    'y'
  ];
  List<Color> colors = [
    Colors.deepOrange[900],
    Colors.deepOrange[800],
    Colors.deepOrange[700],
    Colors.pink[900],
    Colors.pink[800],
    Colors.pink[700],
    Colors.red[900],
    Colors.red[800],
    Colors.red[700],
    Colors.amber[900],
    Colors.amber[800],
    Colors.amber[700],
  ];

  Widget buildLayout() {
    const int COLS = 3;
    const int ROWS = 4;
    int i;
    List<Widget> rowWidgets = new List<Widget>();
    for (var r = 0; r < ROWS; r++) {
      List<Widget> cells = [];
      for (var c = 0; c < COLS; c++) {
        i = r * COLS + c;
        print('Index: $i');
        FlatButton button = FlatButton(
            color: colors[i],
            onPressed: () => {},
            textColor: Colors.white70,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.zero)),
            child: Text(
              vowels[i].toUpperCase() + ' ' + vowels[i],
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Fira Sans Extra Condensed',
                fontSize: 60,
                //fontWeight: FontWeight.bold,
              ),
            ));
        cells.add(Expanded(child: button));
      }
      ;
      rowWidgets.add(new Expanded(
          child: Row(
        children: cells,
        crossAxisAlignment: CrossAxisAlignment.stretch,
      )));
    }
    return Column(
      children: rowWidgets,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
    );
  }

  @override
  Widget build(BuildContext context) {
/*    List<Widget> buttons = new List<Widget>();
    for (var i = 0; i < vowels.length; i++) {
      buttons.add(buildButton(character: vowels[i], color: colors[i]));
    }*/
    return Scaffold(
      appBar: AppBar(
        title: Text('Vietnamese has ${vowels.length} vowels. Tap to hear.'),
        backgroundColor: Color(int.parse('0xff53000B')),
      ),
      body: Center(
        child: buildLayout(),
        /*child: GridView.count(
            shrinkWrap: true,
            padding: EdgeInsets.all(10),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 3,
            children: buttons
        ),*/
      ),
    );
  }
}
