// To parse this JSON data, do
//
//     final error = errorFromJson(jsonString);

import 'dart:convert';

Error errorFromJson(String str) => Error.fromJson(json.decode(str));

String errorToJson(Error data) => json.encode(data.toJson());

class Error {
  Error({
    this.errors,
  });

  List<ErrorElement> errors;

  factory Error.fromJson(Map<String, dynamic> json) => Error(
        errors: json["errors"] == null
            ? null
            : List<ErrorElement>.from(
                json["errors"].map((x) => ErrorElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "errors": errors == null
            ? null
            : List<dynamic>.from(errors.map((x) => x.toJson())),
      };
}

class ErrorElement {
  ErrorElement({
    this.name,
    this.message,
  });

  String name;
  String message;

  factory ErrorElement.fromJson(Map<String, dynamic> json) => ErrorElement(
        name: json["name"] == null ? null : json["name"],
        message: json["message"] == null ? null : json["message"],
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "message": message == null ? null : message,
      };

  Map<String, dynamic> erroToJson() => {
        "name": name == null ? null : name,
        "message": message == null ? null : message,
      };
}

// class Fact {
//   String name;
//   String message;
//
//   Fact(this.name, this.message);
//
//   Fact.fromJson(Map<String, dynamic> json)
//       : name = json['name'],
//         message = json['message'];
//
//   Map<String, dynamic> toJson() => {
//         'name': name,
//         'message': message,
//       };
// }
