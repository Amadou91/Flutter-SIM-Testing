import 'dart:convert';
import 'package:http/http.dart' as http;

Map<String, String> requestHeaders = {
  'Content-type': 'application/json',
  'Accept': '*/*',
  'Host': 'localhost',
  'Accept-Encoding': 'gzip, deflate, br'
};
// Map<String, String> body = {
//   'email':'johnborban@gmail.com',
//   'password':'induction',
// };
final body = """{"email":"johnborban@gmail.com","password":"induction"}""";

Future<Login> fetchLogin() async {
print(body);
  final response = await http.post('http://localhost/api/users/login',
      body: body, headers:requestHeaders);

  if (response.statusCode == 200) {
    print("Logged In");
    return Login.fromJson(jsonDecode(response.body.toString()));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load');
  }
}

Login loginFromJson(String str) => Login.fromJson(json.decode(str));

String loginToJson(Login data) => json.encode(data.toJson());

class Login {
  Login({
    this.userId,
    this.role,
    this.email,
    this.token,
    this.uname,
  });

  String userId;
  String role;
  String email;
  String token;
  String uname;

  factory Login.fromJson(Map<String, dynamic> json) => Login(
        userId: json["userId"],
        role: json["role"],
        email: json["email"],
        token: json["token"],
        uname: json["uname"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "role": role,
        "email": email,
        "token": token,
        "uname": uname,
      };
}
