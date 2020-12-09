import 'dart:async';
import '../utils/network_util.dart';
import '../models/user.dart';

class RestDatasource {
  NetworkUtil _netUtil = new NetworkUtil();
  // ignore: non_constant_identifier_names
  static final BASE_URL = "http://localhost";
  // ignore: non_constant_identifier_names
  static final LOGIN_URL = BASE_URL + "/login";

  Future<User> login(String username, String password) {
    return _netUtil.post(LOGIN_URL, body: {
      "username": username,
      "password": password
    }).then((dynamic res) {
      print(res.toString());
      if(res["error"]) throw new Exception(res["error_msg"]);
      return new User.map(res["user"]);
    });
  }
}