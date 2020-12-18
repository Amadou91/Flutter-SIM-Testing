import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'token.dart';

Future<Inductions> fetchInductions() async {
  final response =
  await http.get('http://localhost/api/inductions/find',
      headers: {"Authorization": authToken.toString()});

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Inductions.fromJson(jsonDecode(response.body.toString()));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('You are not authorized to view this page');
  }
}

Inductions inductionsFromJson(String str) => Inductions.fromJson(json.decode(str));

String inductionsToJson(Inductions data) => json.encode(data.toJson());

class Inductions {
  Inductions({
    this.inductions,
  });

  List<Induction> inductions;

  factory Inductions.fromJson(Map<String, dynamic> json) => Inductions(
    inductions: List<Induction>.from(json["inductions"].map((x) => Induction.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "inductions": List<dynamic>.from(inductions.map((x) => x.toJson())),
  };
}

class Induction {
  Induction({
    this.id,
    this.name,
    this.url,
    this.quiz,
  });

  String id;
  String name;
  String url;
  Quiz quiz;

  factory Induction.fromJson(Map<String, dynamic> json) => Induction(
    id: json["id"],
    name: json["name"],
    url: json["url"],
    quiz: Quiz.fromJson(json["quiz"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "url": url,
    "quiz": quiz.toJson(),
  };
}

class Quiz {
  Quiz({
    this.name,
    this.id,
  });

  String name;
  String id;

  factory Quiz.fromJson(Map<String, dynamic> json) => Quiz(
    name: json["name"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "id": id,
  };
}
