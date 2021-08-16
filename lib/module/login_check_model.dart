// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    this.token,
    this.user,
  });

  String? token;
  User? user;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        token: json["token"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "user": user!.toJson(),
      };
}

class User {
  User({
    this.active,
    this.connectorId,
    this.email,
    this.firstName,
    this.id,
    this.insertInstant,
    this.lastLoginInstant,
    this.lastName,
    this.lastUpdateInstant,
    this.passwordChangeRequired,
    this.passwordLastUpdateInstant,
    this.registrations,
    this.tenantId,
    this.twoFactor,
    this.usernameStatus,
    this.verified,
  });

  bool? active;
  String? connectorId;
  String? email;
  String? firstName;
  String? id;
  int? insertInstant;
  int? lastLoginInstant;
  String? lastName;
  int? lastUpdateInstant;
  bool? passwordChangeRequired;
  int? passwordLastUpdateInstant;
  List<Registration>? registrations;
  String? tenantId;
  TwoFactor? twoFactor;
  String? usernameStatus;
  bool? verified;

  factory User.fromJson(Map<String, dynamic> json) => User(
        active: json["active"],
        connectorId: json["connectorId"],
        email: json["email"],
        firstName: json["firstName"],
        id: json["id"],
        insertInstant: json["insertInstant"],
        lastLoginInstant: json["lastLoginInstant"],
        lastName: json["lastName"],
        lastUpdateInstant: json["lastUpdateInstant"],
        passwordChangeRequired: json["passwordChangeRequired"],
        passwordLastUpdateInstant: json["passwordLastUpdateInstant"],
        registrations: List<Registration>.from(
            json["registrations"].map((x) => Registration.fromJson(x))),
        tenantId: json["tenantId"],
        twoFactor: TwoFactor.fromJson(json["twoFactor"]),
        usernameStatus: json["usernameStatus"],
        verified: json["verified"],
      );

  Map<String, dynamic> toJson() => {
        "active": active,
        "connectorId": connectorId,
        "email": email,
        "firstName": firstName,
        "id": id,
        "insertInstant": insertInstant,
        "lastLoginInstant": lastLoginInstant,
        "lastName": lastName,
        "lastUpdateInstant": lastUpdateInstant,
        "passwordChangeRequired": passwordChangeRequired,
        "passwordLastUpdateInstant": passwordLastUpdateInstant,
        "registrations":
            List<dynamic>.from(registrations!.map((x) => x.toJson())),
        "tenantId": tenantId,
        "twoFactor": twoFactor!.toJson(),
        "usernameStatus": usernameStatus,
        "verified": verified,
      };
}

class Registration {
  Registration({
    this.applicationId,
    this.id,
    this.insertInstant,
    this.lastLoginInstant,
    this.lastUpdateInstant,
    this.usernameStatus,
    this.verified,
    this.roles,
  });

  String? applicationId;
  String? id;
  int? insertInstant;
  int? lastLoginInstant;
  int? lastUpdateInstant;
  String? usernameStatus;
  bool? verified;
  List<String>? roles;

  factory Registration.fromJson(Map<String, dynamic> json) => Registration(
        applicationId: json["applicationId"],
        id: json["id"],
        insertInstant: json["insertInstant"],
        lastLoginInstant: json["lastLoginInstant"],
        lastUpdateInstant: json["lastUpdateInstant"],
        usernameStatus: json["usernameStatus"],
        verified: json["verified"],
        roles: json["roles"] == null
            ? null
            : List<String>.from(json["roles"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "applicationId": applicationId,
        "id": id,
        "insertInstant": insertInstant,
        "lastLoginInstant": lastLoginInstant,
        "lastUpdateInstant": lastUpdateInstant,
        "usernameStatus": usernameStatus,
        "verified": verified,
        "roles":
            roles == null ? null : List<dynamic>.from(roles!.map((x) => x)),
      };
}

class TwoFactor {
  TwoFactor();

  factory TwoFactor.fromJson(Map<String, dynamic> json) => TwoFactor();

  Map<String, dynamic> toJson() => {};
}
