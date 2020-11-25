//this will create a Questions class specifying that all questions
//should entail a questionText and a questionAnswer

class Question {
  String questionText;
  bool questionAnswer;

  Question({String qtn, bool ans}) {
    questionText = qtn;
    questionAnswer = ans;
  }
}
// This class setup private properties and methods for our questions
class Quiz {

// this private variable helps us to keep track of the current question Number.
//Note: it is private because of the leading underscore which was added

  int _questionNumber = 0;

// this List variable will store our questions
//and answers as specified in the questions class

  List<Question> _questionList = [
    Question(qtn: 'Is Engineering Documentation located in Ireland?', ans: true),
    Question(qtn: 'It rains all the time in Ireland', ans: true),
    Question(qtn: 'You are using this app right now, you\'ve got no choice',ans: true),
    Question(qtn: 'The moon is yellow', ans: false),
    Question(qtn: 'Gin is typically included in a Long Island Iced Tea', ans: true),
    Question(qtn: 'Monaco is the smallest country in the world', ans: false),
    Question(qtn: 'Australia is wider than the moon', ans: true),
    Question(qtn: 'Queen Elizabeth II is currently the second longest reigning British monarch', ans: false),
  ];

// this function will access the question number and increment it
// also it will let us know if the questions have been completed
  dynamic nextQuestion(){
    if(_questionNumber < _questionList.length - 1){
      print(_questionNumber);
      _questionNumber++;
    }else{
      bool completed = true;
      return completed;
    }
  }

// this function will return the question text of the
//specific question number text when called in the main.dart
  String getQuestionText(){
    return _questionList[_questionNumber].questionText;
  }

// this function will return the answer of the
//specific question number when called in the main.dart
  bool getQuestionAnswer(){
    return _questionList[_questionNumber].questionAnswer;
  }

// this function will set the question
//number back the 0 when the quiz is restarted
  int startOver(){
    return _questionNumber = 0;
  }
}