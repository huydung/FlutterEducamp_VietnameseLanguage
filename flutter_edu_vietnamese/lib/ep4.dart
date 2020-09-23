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
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.red[900],
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
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
  FlatButton buildButton({String character, Color color}){
    return FlatButton(
      color: color,
      onPressed: () => {},
      textColor: Colors.white70,
      child: Text(character,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,

        ),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    List<String> vowels = [
      'a', 'ă', 'â',
      'e', 'ê', 'i',
      'o', 'ô', 'ơ',
      'u', 'ư', 'y'];
    List<Color> colors = [
      Colors.deepOrange[900], Colors.deepOrange[800], Colors.deepOrange[700],
      Colors.red[900], Colors.red[800], Colors.red[700],
      Colors.pink[900], Colors.pink[800], Colors.pink[700],
      Colors.amber[900], Colors.amber[800], Colors.amber[700],
    ];
    List<Widget> buttons = new List<Widget>();
    for (var i = 0; i < vowels.length; i++){
      buttons.add(buildButton(character: vowels[i], color: colors[i]));
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Vietnamse have ${vowels.length} vowels.'),
      ),
      body: SafeArea(
        child: Center(
          child: GridView.count(
            crossAxisCount: 3,
            children: buttons
          ),
        ),
      ),
    );
  }
}
