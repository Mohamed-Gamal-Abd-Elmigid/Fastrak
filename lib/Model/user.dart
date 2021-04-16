// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.id,
    this.firstName,
    this.lastName,
    this.phone,
    this.email,
    this.socialType,
    this.socialId,
    this.type,
    this.hasPassword,
    this.activationStatus,
    this.accessToken,
    this.profilePicture,
    this.password,
    this.company_name,
  });

  String id;
  String firstName;
  String company_name;
  String lastName;
  String phone;
  String email;
  String password;
  dynamic socialType;
  dynamic socialId;
  int type;
  bool hasPassword;
  int activationStatus;
  String accessToken;
  ProfilePicture profilePicture;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"] == null ? null : json["id"],
        firstName: json["first_name"] == null ? null : json["first_name"],
        lastName: json["last_name"] == null ? null : json["last_name"],
        phone: json["phone"] == null ? null : json["phone"],
        email: json["email"] == null ? null : json["email"],
        socialType: json["social_type"],
        socialId: json["social_id"],
        type: json["type"] == null ? null : json["type"],
        hasPassword: json["has_password"] == null ? null : json["has_password"],
        activationStatus: json["activation_status"] == null
            ? null
            : json["activation_status"],
        accessToken: json["access_token"] == null ? null : json["access_token"],
        profilePicture: json["profile_picture"] == null
            ? null
            : ProfilePicture.fromJson(json["profile_picture"]),
      );

  Map<String, dynamic> toJson() => {
        "password": password == null ? null : password,
        "company_name": company_name == null ? null : company_name,
        "id": id == null ? null : id,
        "first_name": firstName == null ? null : firstName,
        "last_name": lastName == null ? null : lastName,
        "phone": phone == null ? null : phone,
        "email": email == null ? null : email,
        "social_type": socialType,
        "social_id": socialId,
        "type": type == null ? null : type,
        "has_password": hasPassword == null ? null : hasPassword,
        "activation_status": activationStatus == null ? null : activationStatus,
        "access_token": accessToken == null ? null : accessToken,
        "profile_picture":
            profilePicture == null ? null : profilePicture.toJson(),
      };

  Map<String, dynamic> registerToJson() => {
        "password": password == null ? null : password,
        "first_name": firstName == null ? null : firstName,
        "last_name": lastName == null ? null : lastName,
        "phone": phone == null ? null : phone,
        "email": email == null ? null : email,
        "company_name": company_name == null ? null : company_name,
        "profile_picture":
            profilePicture == null ? null : profilePicture.toJson(),
      };
}

class ProfilePicture {
  ProfilePicture({
    this.id,
    this.path,
    this.pathThumbnail,
    this.mimeType,
    this.customProperties,
  });

  int id;
  String path;
  String pathThumbnail;
  String mimeType;
  List<dynamic> customProperties;

  factory ProfilePicture.fromJson(Map<String, dynamic> json) => ProfilePicture(
        id: json["id"] == null ? null : json["id"],
        path: json["path"] == null ? null : json["path"],
        pathThumbnail:
            json["path_thumbnail"] == null ? null : json["path_thumbnail"],
        mimeType: json["mime_type"] == null ? null : json["mime_type"],
        customProperties: json["custom_properties"] == null
            ? null
            : List<dynamic>.from(json["custom_properties"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "path": path == null ? null : path,
        "path_thumbnail": pathThumbnail == null ? null : pathThumbnail,
        "mime_type": mimeType == null ? null : mimeType,
        "custom_properties": customProperties == null
            ? null
            : List<dynamic>.from(customProperties.map((x) => x)),
      };
}

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
}
