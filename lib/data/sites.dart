import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'token.dart';

Future<Sites> fetchSites() async {
final response =
      await http.get('http://localhost/api/sites',
        headers: {"Authorization": authToken.toString()});

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Sites.fromJson(jsonDecode(response.body.toString()));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('You are not authorized to view this page');
  }
}

Sites sitesFromJson(String str) => Sites.fromJson(json.decode(str));

String sitesToJson(Sites data) => json.encode(data.toJson());

class Sites {
  Sites({
    this.sites,
  });

  List<Site> sites;

  factory Sites.fromJson(Map<String, dynamic> json) => Sites(
        sites: List<Site>.from(json["sites"].map((x) => Site.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "sites": List<dynamic>.from(sites.map((x) => x.toJson())),
      };
}

class Site {
  Site({
    this.siteRequirements,
    this.assignedContractors,
    this.id,
    this.jobNumber,
    this.siteName,
    this.dateCreated,
    this.active,
    this.manager,
    this.quiz,
    this.induction,
    this.v,
    this.siteId,
  });

  List<String> siteRequirements;
  List<dynamic> assignedContractors;
  String id;
  String jobNumber;
  String siteName;
  DateTime dateCreated;
  bool active;
  String manager;
  String quiz;
  String induction;
  int v;
  String siteId;

  factory Site.fromJson(Map<String, dynamic> json) => Site(
        siteRequirements:
            List<String>.from(json["siteRequirements"].map((x) => x)),
        assignedContractors:
            List<dynamic>.from(json["assignedContractors"].map((x) => x)),
        id: json["_id"],
        jobNumber: json["jobNumber"],
        siteName: json["siteName"],
        dateCreated: DateTime.parse(json["dateCreated"]),
        active: json["active"],
        manager: json["manager"],
        quiz: json["quiz"],
        induction: json["induction"],
        v: json["__v"],
        siteId: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "siteRequirements": List<dynamic>.from(siteRequirements.map((x) => x)),
        "assignedContractors":
            List<dynamic>.from(assignedContractors.map((x) => x)),
        "_id": id,
        "jobNumber": jobNumber,
        "siteName": siteName,
        "dateCreated": dateCreated.toIso8601String(),
        "active": active,
        "manager": manager,
        "quiz": quiz,
        "induction": induction,
        "__v": v,
        "id": siteId,
      };
}
