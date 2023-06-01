import 'package:bilgiyarismasi/question.dart';

class TestData {
  int _questionIndex = 0;

  List<Soru> _quesitonBank = [
    Soru(question: 'Titanic gelmiş geçmiş en büyük gemidir', response: false),
    Soru(
        question: 'Dünyadaki tavuk sayısı insan sayısından fazladır',
        response: true),
    Soru(question: 'Kelebeklerin ömrü bir gündür', response: false),
    Soru(question: 'Dünya düzdür', response: false),
    Soru(question: 'Kaju fıstığı aslında bir meyvenin sapıdır', response: true),
    Soru(question: 'Fransızlar 80 demek için, 4 - 20 der', response: true),
  ];

  String getQuestion() {
    return _quesitonBank[_questionIndex].question;
  }

  bool getResponse() {
    return _quesitonBank[_questionIndex].response;
  }

  void nextQuestion() {
    if (_questionIndex < _quesitonBank.length - 1) {
      _questionIndex++;
    }
  }

  bool testFinish() {
    if (_questionIndex + 1 >= _quesitonBank.length) {
      return true;
    } else {
      return false;
    }
  }

  void testReturn() {
    _questionIndex = 0;
  }
}
