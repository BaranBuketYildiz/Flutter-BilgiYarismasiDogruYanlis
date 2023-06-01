import 'package:bilgiyarismasi/constans.dart';
import 'package:bilgiyarismasi/test.dart';
import 'package:flutter/material.dart';

void main() => runApp(KnowledgeTest());

class KnowledgeTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.indigo[700],
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuestionPage(),
          ),
        ),
      ),
    );
  }
}

class QuestionPage extends StatefulWidget {
  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  List<Widget> choices = [];
  TestData test_1 = TestData();
  void buttonFunction(bool button) {
    if (test_1.testFinish() == true) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("BRAVO TESTİ BİTİRDİNİZ!!"),
            //content: Text("Butona bastığınızda test en başa döncek"),
            actions: <Widget>[
              TextButton(
                child: Text("BAŞA DÖN"),
                onPressed: () {
                  Navigator.of(context).pop();
                  setState(() {
                    test_1.testReturn();
                    choices = [];
                  });
                },
              ),
            ],
          );
        },
      );
    } else {
      setState(() {
        test_1.nextQuestion();
        if (test_1.getResponse() == button) {
          choices.add(falseIcon);
        } else {
          choices.add(trueIcon);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                test_1.getQuestion(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 3,
          runSpacing: 3,
          children: choices,
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.0),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6),
                    child: ElevatedButton(
                      child: Icon(
                        Icons.thumb_down,
                        size: 30.0,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        buttonFunction(false);
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6),
                    child: ElevatedButton(
                      child:
                          Icon(Icons.thumb_up, size: 30.0, color: Colors.green),
                      onPressed: () {
                        buttonFunction(true);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
