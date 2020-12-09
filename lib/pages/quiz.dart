// this imports default Flutter dart package
import 'package:flutter/material.dart';
import 'package:sim/widgets/quiz_questions.dart';

// this imports a file containing the quiz questions class
// this imports an external package to display svg images in our app

// the main function returns our QuizApp() class and displays in as our entire app

void main() => runApp(QuizApp());

//This is the QuizApp class we refered to in the preview comment //above, it extents the Flutter statelessWidget class and overides //it with our own functionality using the '@override' notation
class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.grey.shade900,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: QuizPage(),
            ),
          ),
        ),
      ),
    );
  }
}
// Note that the above class calls the QuizPage class

//Here in the QuizPage class, we build teh widgets that actually //displays the questions and buttons
class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {

// a variable to store our scores
  List<Icon> scores = [];

// this creates an object of the Quiz class we import
  Quiz quizClass = Quiz();

// this is a variable to keep track of the quiz if completed
  bool completed = false;

// this function checks the user answer if correct
  void checkAnswer(bool userAnswer) {
    bool correctAns = quizClass.getQuestionAnswer();
    setState(() {
      if (quizClass.nextQuestion() == true) {
        print('next question');
        print(quizClass.nextQuestion());
        completed = true;
        if (userAnswer == correctAns) {
          scores.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
        } else {
          scores.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
        }
      } else {
        print('setting marks');
        if (userAnswer == correctAns) {
          scores.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
        } else {
          scores.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
        }
      }
    });
  }

//this is another overriden widget that calls the buildQuestionPage //function to setup our page
  @override
  Widget build(BuildContext context) {
    return buildQuestionsPage();
  }

// this function shows the questions when we start the app, and //showind the completed secttion if the quiz has been completed
  Column buildQuestionsPage() {
    if (completed) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 5,
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Center(
                child: Column(
                  children: <Widget>[
                    Text(
                      'You have successfully completed the quiz',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 25.0),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  textColor: Colors.white,
                  color: Colors.blue.shade500,
                  onPressed: () {
                    setState(() {
                      completed = false;
                      scores = [];
                      quizClass.startOver();
                    });
                  },
                  child: Text(
                    'Start Over',
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  )),
            ),
          ),
          SafeArea(
            child: Row(
              children: scores,
            ),
          )
        ],
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            flex: 5,
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  quizClass.getQuestionText(),
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 25.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  textColor: Colors.white,
                  color: Colors.green.shade500,
                  onPressed: () {
                    checkAnswer(true);
                  },
                  child: Text(
                    'True',
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  )),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  textColor: Colors.white,
                  color: Colors.red.shade500,
                  onPressed: () {
                    checkAnswer(false);
                  },
                  child: Text(
                    'False',
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  )),
            ),
          ),
          SafeArea(
            child: Row(
              children: scores,
            ),
          )
        ],
      );
    }
  }
}