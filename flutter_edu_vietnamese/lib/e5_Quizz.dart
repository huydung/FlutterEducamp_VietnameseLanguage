import 'dart:io';

import 'package:Vietnamese_and_Flutter_Educamp/consts.dart';
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
    print(_currentQuestion.questionText);
  }

  List<Widget> buildAnswerButtons() {
    List<Widget> buttons = List();
    _currentQuestion.options.forEach((element) {
      buttons.add(Padding(
        padding: const EdgeInsets.symmetric(
            vertical: 0, horizontal: kSmallMargin),
        child: FlatButton(
          child: Text(
            element,
            style: TextStyle(color: Colors.white),
          ),
          color: kHDIBGColor,
          padding: EdgeInsets.symmetric(
              vertical: kSmallMargin, horizontal: 2 * kStandardMargin),
          onPressed: () {},
        ),
      ));
    });
    return buttons;
  }

  List<Widget> buildFeedbackButtons() {
    List<Widget> icons = List();
    _questionBank.feedbacks.forEach((element) {
      Icon icon;
      switch (element.state) {
        case QuestionFeedbackState.UNANSWERD:
          icon = Icon(
            Icons.check_box_outline_blank,
            color: Colors.grey[800],
            size: kStandardMargin,
          );
          break;
        case QuestionFeedbackState.CORRECT:
          icon = Icon(
            Icons.check_box,
            color: Colors.green,
            size: kStandardMargin,
          );
          break;
        case QuestionFeedbackState.WRONG:
          icon = Icon(
            Icons.indeterminate_check_box,
            color: Colors.red,
            size: kStandardMargin,
          );
          break;
        default:
          break;
      }
      icons.add(icon);
    });
    return icons;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('5. Vietnamese Dishes Quiz'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: kSmallMargin, horizontal: kStandardMargin),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 1,
                child: Row(
                  children: buildFeedbackButtons(),
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              ),
              SizedBox(height: kStandardMargin,),
              Expanded(
                flex: 8,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ListView(
                      shrinkWrap: true,
                      children: [
                        ListTile(
                          leading: Icon(
                            Icons.help,
                            color: Colors.grey,
                          ),
                          title: Text(_currentQuestion.questionText),
                        ),
                        Image(
                          image: AssetImage('assets/' +
                              (_currentQuestion.assetImagePath ??
                                  'vietnamflag.png')),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: buildAnswerButtons(),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
