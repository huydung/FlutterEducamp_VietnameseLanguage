import 'package:Vietnamese_and_Flutter_Educamp/consts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'questionBrain.dart';

// void main() {
//   runApp(E4_TonalsApp());
// }

class PageQuiz extends StatefulWidget {
  PageQuiz({Key key, this.title}) : super(key: key);
  final String title;

  @override
  PageQuizState createState() => PageQuizState();
}

class PageQuizState extends State<PageQuiz> {
  Question _currentQuestion;
  QuestionBank _questionBank;

  void _checkAnswerAndProceed(String answer) {
    setState(() {
      _questionBank.submitAnswer(answer);
      if (_questionBank.goToNextQuestion()) {
        _currentQuestion = _questionBank.getActiveQuestion();
      } else {
        showResultDialog();
      }
    });
  }

  Future<void> showResultDialog() async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Quiz Result'),
            content: ListTile(
              leading: Icon(Icons.info),
              title: Text(
                  'You scored ${_questionBank.getScore()}/${_questionBank.feedbacks.length}'),
            ),
            actions: [
              FlatButton(
                child: Text('OK, Quit'),
                onPressed: () {
                  Navigator.of(context)
                      .popUntil(ModalRoute.withName(Routes.HOME));
                },
              ),
              FlatButton(
                child: Text('Try Again'),
                onPressed: () {
                  Navigator.of(context).pop();
                  setState(() {
                    _questionBank.restart();
                    _currentQuestion = _questionBank.getActiveQuestion();
                  });
                },
              )
            ],
          );
        });
  }

  @override
  void initState() {
    super.initState();
    _questionBank = new QuestionBank();
    _currentQuestion = _questionBank.getActiveQuestion();
    print(_currentQuestion.questionText);
  }

  List<Widget> buildAnswerButtons() {
    List<Widget> buttons = List();
    _currentQuestion.options.forEach((element) {
      buttons.add(GestureDetector(
        onTap: () {
          _checkAnswerAndProceed(element);
        },
        child: Container(
          decoration: BoxDecoration(
            color: kHDIBGColor,
            borderRadius: BorderRadius.all(Radius.circular(kHDISmallBorder)),
          ),
          margin: EdgeInsets.only(
            bottom: kHDISmallMargin * 0.5,
          ),
          padding: EdgeInsets.symmetric(
            vertical: kHDISmallMargin,
            horizontal: 0,
          ),
          width: double.infinity,
          child: Center(
            child: Text(
              element,
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ));
    });
    return buttons;
  }

  List<Widget> buildFeedbackButtons() {
    List<Widget> icons = List();
    _questionBank.feedbacks.forEach((element) {
      Widget icon;
      switch (element) {
        case QuestionFeedback.UNANSWERD:
          icon = Padding(
            padding: const EdgeInsets.only(
                right: kHDISmallMargin * 0.5, left: kHDISmallMargin * 0.5),
            child: Icon(
              Icons.fiber_manual_record,
              color: kHDISubtleColor,
              size: kHDISmallMargin,
            ),
          );
          break;
        case QuestionFeedback.CORRECT:
          icon = Icon(
            Icons.check_circle_outline,
            color: Colors.green,
            size: kHDIStandardMargin,
          );
          break;
        case QuestionFeedback.WRONG:
          icon = Icon(
            Icons.remove_circle_outline,
            color: Colors.red,
            size: kHDIStandardMargin,
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
              vertical: kHDISmallMargin, horizontal: kHDIStandardMargin),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 1,
                child: Row(
                  children: buildFeedbackButtons(),
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              ),
              Expanded(
                flex: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
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
                  flex: 4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: buildAnswerButtons(),
                    // crossAxisCount: 2,
                    // childAspectRatio: 4.0,
                    // shrinkWrap: true,
                    // crossAxisSpacing: kHDISmallMargin,
                    // mainAxisSpacing: kHDISmallMargin,
                    // reverse: true,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
