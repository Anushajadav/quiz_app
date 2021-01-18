import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/question.dart';
import 'package:quiz_app/questions.dart';

void main() {
  runApp(MyApp());
}

//ui changes dynamically
class MyApp extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<MyApp> {
  int questionNumber = 0;
  int currentScore = 0;
  Questions questions = Questions();
  void updateQ() {
    setState(() {
      questionNumber = questionNumber + 1;
    });
  }

  bool checkQ(int questionNumber) {
    return questionNumber < questions.questionBank.length ? true : false;
  }

  void updateScore(bool choice, int questionNumber) {
    if (questions.questionBank.length == questionNumber) {
      print("End of question");
    } else {
      if (questions.questionBank[questionNumber].answer == choice) {

        setState(() {
          currentScore++;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Container(
            margin: EdgeInsets.all(10.0),
            padding: EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                    child: Text(
                  checkQ(questionNumber)
                      ? questions.questionBank[questionNumber].questionText
                          .toString()
                      : "End",
                  style: TextStyle(
                    fontSize: 40.0,
                  ),
                )),
                SizedBox(
                  height: 10.0,
                ), //to provide a space
                if (checkQ(questionNumber))
                  RaisedButton(
                      child: Text(
                        'True',
                        style: TextStyle(fontSize: 40.0),
                      ),
                      onPressed: () {
                        setState(() {
                          if (questions.questionBank.length == questionNumber) {
                            print("End of question");
                          } else {
                            updateScore(true, questionNumber);
                            updateQ();
                          }
                        });
                      }),
                SizedBox(
                  height: 10.0,
                ), //to provide a space
                if (checkQ(questionNumber))
                  RaisedButton(
                      child: Text(
                        'False',
                        style: TextStyle(fontSize: 40.0),
                      ),
                      onPressed: () {
                        setState(() {
                          if (questions.questionBank.length == questionNumber) {
                            print("End of question");
                          } else {
                            updateScore(false, questionNumber);
                            updateQ();
                          }
                        });
                      }),
                SizedBox(
                  height: 40.0,
                ), //to provide a space
                Center(
                  child: Text(
                    'Current Score',
                    style: TextStyle(
                      fontSize: 40.0,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    '${currentScore}',
                    style:
                        TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
