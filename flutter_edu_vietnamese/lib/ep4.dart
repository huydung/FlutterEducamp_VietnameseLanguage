import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

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
  List<String> vowelSounds = [
    'a.wav',
    'a2.wav',
    'a3.wav',
    'e.wav',
    'e2.wav',
    'i.wav',
    'o.wav',
    'o2.wav',
    'o3.wav',
    'u.wav',
    'u2.wav',
    'y.wav'
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

  AudioCache _player;
  void _playVowelSound(int index){
    //final player = AudioCache(prefix: 'assets/audio/');
    if( _player != null ){
      _player.play(vowelSounds[index]);
    }

  }
  Widget buildLayout() {

    const int COLS = 3;
    const int ROWS = 4;

    List<Widget> rowWidgets = new List<Widget>();
    for (var r = 0; r < ROWS; r++) {
      List<Widget> cells = [];
      for (var c = 0; c < COLS; c++) {
        int i = r * COLS + c;

        FlatButton button = FlatButton(
            color: colors[i],
            onPressed: () => {_playVowelSound(i)},
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
    if(_player == null){
      _player =  AudioCache(prefix: 'assets/audio/');
      print("Created the AudioCache player");
    }
    _player.loadAll(vowelSounds);
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
