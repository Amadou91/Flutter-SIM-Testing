import 'dart:convert';

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