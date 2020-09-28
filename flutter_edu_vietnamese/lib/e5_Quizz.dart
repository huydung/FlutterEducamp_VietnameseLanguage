import 'dart:io';

import 'package:Vietnamese_and_Flutter_Educamp/question_data_management.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

// void main() {
//   runApp(E4_TonalsApp());
// }


class E5_QuizPage extends StatefulWidget {
  E5_QuizPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _E5_QuizPageState createState() => _E5_QuizPageState();
}



class _E5_QuizPageState extends State<E5_QuizPage> {
  Question _currentQuestion;
  QuestionBank _questionBank;
  List<QuestionFeedback> _feedbacks;

  @override
  void initState() {
    super.initState();
    _questionBank = new QuestionBank();
    _currentQuestion = _questionBank.getActiveQuestion();
    _feedbacks = _questionBank.feedbacks;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('5. Vietnamese Dishes Quiz'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Card(

            ),

          ],
        ),
      ),
    );
  }
}
