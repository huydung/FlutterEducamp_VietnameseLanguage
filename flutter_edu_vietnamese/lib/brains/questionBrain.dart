import 'package:flutter/foundation.dart';

class Question {
  String _questionText;
  List<String> _options;
  String _correctOption;
  String _assetImagePath;
  QuestionFeedback _feedback = QuestionFeedback.UNANSWERD;
  String _chosenAnswer;

  String get questionText => _questionText;
  List<String> get options => _options;
  String get correctOption => _correctOption;
  String get assetImagePath => _assetImagePath;
  QuestionFeedback get feedback => _feedback;
  String get chosenAnswer => _chosenAnswer;

  Question(
      {@required String questionText,
      @required List<String> options,
      @required String correctOption,
      assetImagePath})
      : _questionText = questionText,
        _correctOption = correctOption,
        _options = options,
        _assetImagePath = assetImagePath;

  void submitAnswer(String chosenAnswer) {
    if (chosenAnswer == null || chosenAnswer == '') {
      _feedback = QuestionFeedback.UNANSWERD;
    } else if (chosenAnswer == _correctOption) {
      _feedback = QuestionFeedback.CORRECT;
    } else {
      _feedback = QuestionFeedback.WRONG;
    }
  }
}

enum QuestionFeedback {
  UNANSWERD,
  CORRECT,
  PARTIALLY_CORRECT,
  WRONG,
}

class QuestionBank {
  int _index = 0;
  List<Question> _questions;
  List<QuestionFeedback> _feedbacks = List();
  List<QuestionFeedback> get feedbacks => _feedbacks;

  bool goToNextQuestion() {
    if (_index < _questions.length - 1) {
      _index++;
      return true;
    }
    return false;
  }

  int getScore() {
    int score = 0;
    _questions.forEach((element) {
      if (element.feedback == QuestionFeedback.CORRECT) {
        score++;
      }
    });
    return score;
  }

  Question getActiveQuestion() {
    print('getActiveQuestion( _index = $_index and questions length = '
        '${_questions.length} '
        ')');
    if (_questions != null && _index > -1 && _index < _questions.length) {
      return _questions[_index];
    }
    return null;
  }

  void submitAnswer(String answer) {
    Question q = getActiveQuestion();
    q.submitAnswer(answer);
    _feedbacks[_index] = q.feedback;
  }

  bool isFinished() {
    return _index >= _questions.length - 1;
  }

  //https://vietnamdiscovery.com/top-vietnam/best-vietnamese-foods/
  QuestionBank() {
    _questions = [
      Question(
          questionText: 'What is the name of this dish?',
          options: ['Phở Gà', 'Bún Bò'],
          correctOption: 'Phở Gà',
          assetImagePath: 'quiz_images/pho.jpg'),
      Question(
          questionText: 'What is the name of this dish?',
          options: ['Bánh Mỳ', 'Bánh Giò'],
          correctOption: 'Bánh Mỳ',
          assetImagePath: 'quiz_images/banhmy.jpg'),
      Question(
          questionText: 'What is the name of this dish?',
          options: ['Nem Rán', 'Gỏi Cuốn'],
          correctOption: 'Gỏi Cuốn',
          assetImagePath: 'quiz_images/goicuon.jpg'),
      Question(
          questionText: 'What is the name of this dish?',
          options: ['Cơm Tấm', 'Xôi Chả'],
          correctOption: 'Cơm Tấm',
          assetImagePath: 'quiz_images/comtam.jpg'),
      Question(
          questionText: 'What is the name of this dish?',
          options: ['Bún Chá', 'Bún Riêu', 'Miến Gà'],
          correctOption: 'Bún Chá',
          assetImagePath: 'quiz_images/buncha.jpg'),
      Question(
          questionText: 'What is the name of this dish?',
          options: ['Bánh Cuốn', 'Bánh Trắng', 'Gỏi Cuốn'],
          correctOption: 'Bánh Cuốn',
          assetImagePath: 'quiz_images/banhcuon.jpg'),
      Question(
          questionText: 'What is the name of this dish?',
          options: ['Nem Rán', 'Gỏi Cuốn', 'Bánh Gối'],
          correctOption: 'Nem Rán',
          assetImagePath: 'quiz_images/nemran.jpg'),
      Question(
          questionText: 'What is the name of this dish?',
          options: ['Bún Bò Huế', 'Bún Cá', 'Phở', 'Mì Quảng'],
          correctOption: 'Bún Bò Huế',
          assetImagePath: 'quiz_images/bunbohue.jpg'),
      Question(
          questionText: 'What is the name of this dish?',
          options: ['Mì Quảng', 'Bánh Đa Cá Rô', 'Bún Bò Huế', 'Bún Cá'],
          correctOption: 'Mì Quảng',
          assetImagePath: 'quiz_images/miquang.jpg'),
      Question(
          questionText: 'What is the name of this dish?',
          options: ['Bánh Xèo', 'Bánh Gối', 'Bánh Mỳ', 'Bánh Giò'],
          correctOption: 'Bánh Xèo',
          assetImagePath: 'quiz_images/banhxeo.jpg'),
    ];
    restart();
    //print('Finish Initiated Questions. First question: ${_questions[0].questionText}');
  }

  void restart() {
    _questions.shuffle();
    _feedbacks.clear();
    _questions.forEach((element) {
      element.submitAnswer(null);
      _feedbacks.add(element.feedback);
    });
    _index = 0;
  }
}
