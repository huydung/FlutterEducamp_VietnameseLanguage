import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() {
  runApp(TonalsApp());
}

class TonalsApp extends StatelessWidget {
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

//Bug https://github.com/luanpotter/audioplayers/issues/344
void audioPlayerHandler(AudioPlayerState value) => print('state => '
    '$value');


class _MyHomePageState extends State<MyHomePage> {
//https://www.youtube.com/watch?v=Jifb6YF5kj8&feature=youtu.be
//https://www.icanreadvietnamese.com/part-i-principles/02-the-vietnamese-tones#:~:text=The%20five%20symbols%20for%20the,their%20names%20in%20alphabetical%20order.
  //https://vietnamesetypography.com/history/
  List<String> _tones = [
    'ngang', 'i', 'la',
    'sắc', 'í', 'lá',
    'huyền', 'ì', 'là',
    'hỏi', 'ỉ', 'lả',
    'ngã', 'ĩ', 'lã',
    'nặng', 'ị', 'lạ',
  ];
  static List<String> _toneSounds = [
    'ngang.wav', 'ngang_i.wav','ngang_la.wav',
    'sac.wav', 'sac_i.wav','sac_la.wav',
    'huyen.wav', 'huyen_i.wav','huyen_la.wav',
    'hoi.wav', 'hoi_i.wav','hoi_la.wav',
    'nga.wav', 'nga_i.wav','nga_la.wav',
    'nang.wav', 'nang_i.wav','nang_la.wav',
  ];
  List<Color> colors = [
    Colors.deepOrange[800], Colors.deepOrange[600], Colors.deepOrange[700],
    Colors.purple[800],Colors.purple[600],Colors.purple[700],
    Colors.red[800],Colors.red[600],Colors.red[700],
    Colors.indigo[800],Colors.indigo[600],Colors.indigo[700],
    Colors.pink[800],Colors.pink[600],Colors.pink[700],
    Colors.deepPurple[800],Colors.deepPurple[600],Colors.deepPurple[700],

  ];
  static AudioPlayer _player = AudioPlayer();
  static AudioCache _assetsPlayer = AudioCache(prefix: 'assets/audio/');

  static void _playVowelSound(int index){
    if( _assetsPlayer != null ){
      if (Platform.isIOS) {
        _player.monitorNotificationStateChanges(audioPlayerHandler);
      }
      _assetsPlayer.play(_toneSounds[index]);
    }

  }
  Widget buildLayout() {

    const int COLS = 3;
    const int ROWS = 6;

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
               _tones[i],
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: i % 3 == 0 ? 'Source Sans Pro' : 'Fira Sans Extra '
                    'Condensed',
                fontSize: i % 3 == 0 ? 30 : 42,

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
    if(_assetsPlayer != null){
      //_assetsPlayer.loadAll(_toneSounds);
      //print('Pre-loaded all sounds');
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Vietnamese has ${(_tones.length / 3).round()} tones.'),
        backgroundColor: Colors.grey[900],
      ),
      body: Center(
        child: buildLayout(),
      ),
    );
  }
}
