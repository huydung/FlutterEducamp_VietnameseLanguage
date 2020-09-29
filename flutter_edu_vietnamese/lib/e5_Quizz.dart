import 'package:Vietnamese_and_Flutter_Educamp/consts.dart';
import 'package:Vietnamese_and_Flutter_Educamp/question_data_management.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
                  'You scored ${_questionBank.getScore()}/${_questionBank.questions.length}'),
            ),
            actions: [
              FlatButton(
                child: Text('OK, Quit'),
                onPressed: () {
                  Navigator.of(context).popUntil(ModalRoute.withName('/'));
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
      buttons.add(RaisedButton(
        child: Text(
          element,
          style: TextStyle(color: Colors.white),
        ),
        color: kHDIBGColor,
        onPressed: () {
          _checkAnswerAndProceed(element);
        },
      ));
    });
    return buttons;
  }

  List<Widget> buildFeedbackButtons() {
    List<Widget> icons = List();
    _questionBank.questions.forEach((element) {
      Widget icon;
      switch (element.feedback) {
        case QuestionFeedback.UNANSWERD:
          icon = Padding(
            padding: const EdgeInsets.only(
                right: kSmallMargin * 0.5, left: kSmallMargin * 0.5),
            child: Icon(
              Icons.fiber_manual_record,
              color: Colors.grey[800],
              size: kSmallMargin,
            ),
          );
          break;
        case QuestionFeedback.CORRECT:
          icon = Icon(
            Icons.check_circle_outline,
            color: Colors.green,
            size: kStandardMargin,
          );
          break;
        case QuestionFeedback.WRONG:
          icon = Icon(
            Icons.remove_circle_outline,
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
                flex: 8,
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
                  flex: 2,
                  child: GridView.count(
                    children: buildAnswerButtons(),
                    crossAxisCount: 2,
                    childAspectRatio: 4.0,
                    shrinkWrap: true,
                    crossAxisSpacing: kSmallMargin,
                    mainAxisSpacing: kSmallMargin,
                    reverse: true,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
