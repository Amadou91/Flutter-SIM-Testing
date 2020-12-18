import 'package:flutter/material.dart';
import 'package:sim/pages/dashboard.dart';
import 'package:sim/pages/inductions.dart';
import 'package:sim/pages/questions.dart';
import 'package:sim/pages/quiz.dart';
import 'package:sim/pages/quizzes.dart';
import 'package:sim/pages/sites.dart';
import 'package:sim/pages/add_license.dart';
import 'package:sim/pages/users.dart';
import '../pages/home.dart';
import '../pages/login.dart';

final routes = {
  '/login':         (BuildContext context) => new LoginScreen(),
  '/home':         (BuildContext context) => new HomeScreen(),
  '/dashboard':         (BuildContext context) => new DashScreen(),
  '/' :          (BuildContext context) => new LoginScreen(),
  '/users': (BuildContext context) => new PageUsers(),
  '/inductions': (BuildContext context) => new PageInductions(),
  '/questions': (BuildContext context) => new PageQuestions(),
 //'/quiz': (BuildContext context) => new PageQuiz(),
  '/quiz': (BuildContext context) => new QuizApp(),
  '/quizzes': (BuildContext context) => new PageQuizzes(),
  '/sites': (BuildContext context) => new PageSites(),
  '/uploadphoto': (BuildContext context) => new PageUploadPhoto(),
};