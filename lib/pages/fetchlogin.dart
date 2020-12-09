import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sim/widgets/auth_table.dart';
import '../data/rest_ds.dart';
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
    x = 1;

    return Login.fromJson(jsonDecode(response.body.toString()));
  } else {

    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Wrong Credentials');
  }
}