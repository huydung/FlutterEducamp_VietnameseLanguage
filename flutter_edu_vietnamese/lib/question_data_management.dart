import 'package:flutter/material.dart';

class Question {
  String questionText;
  List<String> options;
  String correctOption;
  String assetImagePath;

  Question(
      {@required this.questionText,
      @required this.options,
      @required this.correctOption,
      this.assetImagePath});
}

enum QuestionFeedbackState {
  UNANSWERD,
  CORRECT,
  PARTIALLY_CORRECT,
  WRONG,
}

class QuestionFeedback {
  Question q;
  String chosenAnswer;
  QuestionFeedbackState _state;

  QuestionFeedback({@required this.q,
    @required this.chosenAnswer,}){
    if( chosenAnswer == null || chosenAnswer == '' ){
      _state = QuestionFeedbackState.UNANSWERD;
    } else if( chosenAnswer == q.correctOption ){
      _state = QuestionFeedbackState.CORRECT;
    } else {
      _state = QuestionFeedbackState.WRONG;
    }
  }

  QuestionFeedbackState get state => _state;

}

class QuestionBank {
  int _index = 0;
  List<Question> _questions;
  List<QuestionFeedback> _feedbacks = List();

  Question getActiveQuestion() {
    Question q;
    if (_index > -1 && _index < _questions.length) {
      q = _questions[_index];
    }
    if (_index < _questions.length - 1) {
      _index++;
    }
    return q;
  }

  List<QuestionFeedback> get feedbacks => _feedbacks;

  bool isFinished() {
    return _index >= _questions.length - 1;
  }

  //https://vietnamdiscovery.com/top-vietnam/best-vietnamese-foods/
  QuestionBank() {
    _questions = [
      Question(
          questionText: 'What is the name of this dish?',
          options: ['Phở', 'Bún Bò'],
          correctOption: 'Phở',
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
          options: ['Bún Chá', 'Bún Riêu'],
          correctOption: 'Bún Chá',
          assetImagePath: 'quiz_images/buncha.jpg'),
      Question(
          questionText: 'What is the name of this dish?',
          options: ['Bánh Cuốn', 'Bánh Trắng'],
          correctOption: 'Bánh Cuốn',
          assetImagePath: 'quiz_images/banhcuon.jpg'),
      Question(
          questionText: 'What is the name of this dish?',
          options: ['Nem Rán', 'Gỏi Cuốn'],
          correctOption: 'Nem Rán',
          assetImagePath: 'quiz_images/nemran.jpg'),
      Question(
          questionText: 'What is the name of this dish?',
          options: ['Bún Bò Huế', 'Bún Cá'],
          correctOption: 'Bún Bò Huế',
          assetImagePath: 'quiz_images/bunbohue.jpg'),
      Question(
          questionText: 'What is the name of this dish?',
          options: ['Mì Quảng', 'Bánh Đa Cá Rô'],
          correctOption: 'Mì Quảng',
          assetImagePath: 'quiz_images/miquang.jpg'),
      Question(
          questionText: 'What is the name of this dish?',
          options: ['Bánh Xèo', 'Bánh Gối'],
          correctOption: 'Bánh Xèo',
          assetImagePath: 'quiz_images/banhxeo.jpg'),
    ];
    _questions.shuffle();
    _questions.forEach((element) {
      _feedbacks.add(QuestionFeedback(q: element, chosenAnswer: null));
    });
  }
}
