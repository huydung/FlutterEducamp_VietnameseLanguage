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
      title: 'Vietnamese The Beautiful Language - Flutter EduCamp',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Vietnamese The Beautiful Language'),
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

  Future<void> sendEmail() async {
    final Email email = Email(
      body: 'A great app about Vietnamese Language and Flutter Development',
      subject: 'Flutter Development Education + Vietnamese Language Beauty',
      recipients: ['contact@huydung.com'],
      // cc: ['cc@example.com'],
      // bcc: ['bcc@example.com'],
      // attachmentPaths: ['/path/to/attachment.zip'],
      isHTML: true,
    );

    await FlutterEmailSender.send(email);
  }

  void openTab(){
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[900],
      appBar: AppBar(
        title: Text("#1: Simple Scaffolding"),
        backgroundColor: Colors.red[900],
      ),
      drawer: Drawer(
        child: ListView (
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Flutter Showcase',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              decoration: BoxDecoration(
                color: Colors.red[900],
                image: DecorationImage(image: AssetImage('assets/poster.jpg')),
              ),
            ),
            ListTile(
              title: Text('Introduction'),
              onTap: openTab,
            ),
            ListTile(
              title: Text('#1: Simple Scaffolding'),
              onTap: openTab,
            )
          ],
        )
      ),
      body: Center(
        child: Image(
          image: AssetImage('assets/poster.jpg'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: sendEmail,
        tooltip: 'Share the app',
        child: Icon(Icons.email),
        backgroundColor: Colors.red[900],
        isExtended: true,
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
