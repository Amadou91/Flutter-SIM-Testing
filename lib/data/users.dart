import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sim/data/token.dart';

Future<Users> fetchUsers() async {
  //final response =('{"users":[{"sites":[],"contractorRequirements":[],"documents":[],"inductions":[],"_id":"5fc905e6369fa4001fe92a13","name":"John Orban","role":"superadmin","phone":"353871234567","email":"johnborban@gmail.com","active":true,"dateCreated":"2020-12-03T15:36:06.011Z","picture":"","licenses":14,"discipline":"administrator","__v":0,"createdBy":"5fc905e6369fa4001fe92a13","id":"5fc905e6369fa4001fe92a13"}]}');
  // ('{"users":[{"sites":[],"contractorRequirements":[],"_id":"5fa18badfbefd9001f9e83a7","name":"JohnOrban","role":"superadmin","phone":"353871234567","email":"johnborban@gmail.com","active":true,"dateCreated":"2020-11-03T16:56:13.914Z","picture":"","licenses":14,"discipline":"administrator","__v":0,"createdBy":"5fa18badfbefd9001f9e83a7","id":"5fa18badfbefd9001f9e83a7"},{"sites":["5fa2c41307e21d0020552aaa","5fa2c41307e21d0020552aaa","5fa2c41307e21d0020552aaa","5fa2c41307e21d0020552aaa","5fa2c41307e21d0020552aaa"],"contractorRequirements":[],"_id":"5fa2bfe39f11370020bb06ce","name":"John Orban","role":"contractor","phone":"353833942186","email":"johnb3orban@gmail.com","active":true,"createdBy":"5fa18badfbefd9001f9e83a7","dateCreated":"2020-11-04T14:51:15.455Z","picture":"","licenses":13,"discipline":"scaffolding","__v":5,"id":"5fa2bfe39f11370020bb06ce"},{"sites":[],"contractorRequirements":[],"_id":"5fa2c00a9f11370020bb06cf","name":"John Orban","role":"admin","phone":"353833942186","email":"Test@gmail.com","active":true,"createdBy":"5fa18badfbefd9001f9e83a7","dateCreated":"2020-11-04T14:51:54.783Z","picture":"","licenses":14,"discipline":"roofing","__v":0,"id":"5fa2c00a9f11370020bb06cf"},{"sites":[],"contractorRequirements":[],"_id":"5fa2c2c707e21d0020552aa5","name":"Tim","role":"subcontractor","phone":"Bob","email":"TimBob@gmail.com","active":true,"createdBy":"5fa2bfe39f11370020bb06ce","dateCreated":"2020-11-04T15:03:35.926Z","picture":"","licenses":0,"discipline":"admin","__v":0,"id":"5fa2c2c707e21d0020552aa5"}]}');
  final response =       await http.get('http://localhost/api/users',
      headers: {"Authorization": authToken.toString()});

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Users.fromJson(jsonDecode(response.body.toString()));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('You are not authorized to view this page');
  }
}

Users usersFromJson(String str) => Users.fromJson(json.decode(str));

String usersToJson(Users data) => json.encode(data.toJson());

class Users {
  Users({
    this.users,
  });

  List<User> users;

  factory Users.fromJson(Map<String, dynamic> json) => Users(
    users: List<User>.from(json["users"].map((x) => User.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "users": List<dynamic>.from(users.map((x) => x.toJson())),
  };
}

class User {
  User({
    this.sites,
    this.contractorRequirements,
    this.documents,
    this.inductions,
    this.id,
    this.name,
    this.role,
    this.phone,
    this.email,
    this.active,
    this.dateCreated,
    this.picture,
    this.licenses,
    this.discipline,
    this.v,
    this.createdBy,
    this.userId,
  });

  List<dynamic> sites;
  List<dynamic> contractorRequirements;
  List<dynamic> documents;
  List<dynamic> inductions;
  String id;
  String name;
  String role;
  String phone;
  String email;
  bool active;
  DateTime dateCreated;
  String picture;
  int licenses;
  String discipline;
  int v;
  String createdBy;
  String userId;

  factory User.fromJson(Map<String, dynamic> json) => User(
    sites: List<dynamic>.from(json["sites"].map((x) => x)),
    contractorRequirements: List<dynamic>.from(json["contractorRequirements"].map((x) => x)),
    documents: List<dynamic>.from(json["documents"].map((x) => x)),
    inductions: List<dynamic>.from(json["inductions"].map((x) => x)),
    id: json["_id"],
    name: json["name"],
    role: json["role"],
    phone: json["phone"],
    email: json["email"],
    active: json["active"],
    dateCreated: DateTime.parse(json["dateCreated"]),
    picture: json["picture"],
    licenses: json["licenses"],
    discipline: json["discipline"],
    v: json["__v"],
    createdBy: json["createdBy"],
    userId: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "sites": List<dynamic>.from(sites.map((x) => x)),
    "contractorRequirements": List<dynamic>.from(contractorRequirements.map((x) => x)),
    "documents": List<dynamic>.from(documents.map((x) => x)),
    "inductions": List<dynamic>.from(inductions.map((x) => x)),
    "_id": id,
    "name": name,
    "role": role,
    "phone": phone,
    "email": email,
    "active": active,
    "dateCreated": dateCreated.toIso8601String(),
    "picture": picture,
    "licenses": licenses,
    "discipline": discipline,
    "__v": v,
    "createdBy": createdBy,
    "id": userId,
  };
}