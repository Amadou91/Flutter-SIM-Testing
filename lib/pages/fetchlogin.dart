import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sim/models/user.dart';
import 'login.dart';



Future<Login> fetchLogin() async {
  Map<String, String> requestHeaders = {
    'Content-type': 'application/json',
    'Accept': '*/*',
  };
  // Map<String, String> body = {
  //   '"email"': '"johnborban@gmail.com"',
  //   '"password"': '"induction"',
  // };
  Map<String, String> body = {
    '"email"': '"' + username.text.toString() + '"',
    '"password"': '"' + password.text.toString() + '"',
  };
  print(body);

  final response = await http.post('http://localhost/api/users/login',
      body: body.toString(), headers: requestHeaders);

  if (response.statusCode == 200) {
    loggedIn = 1;

    return Login.fromJson(jsonDecode(response.body.toString()));
  } else {

    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Wrong Credentials');
  }
}