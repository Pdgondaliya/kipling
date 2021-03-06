// To parse this JSON data, do
//
//     final fusionAuthRegisterModel = fusionAuthRegisterModelFromJson(jsonString);

import 'dart:convert';

FusionAuthRegisterModel fusionAuthRegisterModelFromJson(String str) =>
    FusionAuthRegisterModel.fromJson(json.decode(str));

String fusionAuthRegisterModelToJson(FusionAuthRegisterModel data) =>
    json.encode(data.toJson());

class FusionAuthRegisterModel {
  FusionAuthRegisterModel({
    this.token,
    this.user,
  });

  String? token;
  User? user;

  factory FusionAuthRegisterModel.fromJson(Map<String, dynamic> json) =>
      FusionAuthRegisterModel(
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
    this.id,
    this.insertInstant,
    this.lastLoginInstant,
    this.lastUpdateInstant,
    this.passwordChangeRequired,
    this.passwordLastUpdateInstant,
    this.tenantId,
    this.twoFactor,
    this.usernameStatus,
    this.verified,
  });

  bool? active;
  String? connectorId;
  String? email;
  String? id;
  int? insertInstant;
  int? lastLoginInstant;
  int? lastUpdateInstant;
  bool? passwordChangeRequired;
  int? passwordLastUpdateInstant;
  String? tenantId;
  TwoFactor? twoFactor;
  String? usernameStatus;
  bool? verified;

  factory User.fromJson(Map<String, dynamic> json) => User(
        active: json["active"],
        connectorId: json["connectorId"],
        email: json["email"],
        id: json["id"],
        insertInstant: json["insertInstant"],
        lastLoginInstant: json["lastLoginInstant"],
        lastUpdateInstant: json["lastUpdateInstant"],
        passwordChangeRequired: json["passwordChangeRequired"],
        passwordLastUpdateInstant: json["passwordLastUpdateInstant"],
        tenantId: json["tenantId"],
        twoFactor: TwoFactor.fromJson(json["twoFactor"]),
        usernameStatus: json["usernameStatus"],
        verified: json["verified"],
      );

  Map<String, dynamic> toJson() => {
        "active": active,
        "connectorId": connectorId,
        "email": email,
        "id": id,
        "insertInstant": insertInstant,
        "lastLoginInstant": lastLoginInstant,
        "lastUpdateInstant": lastUpdateInstant,
        "passwordChangeRequired": passwordChangeRequired,
        "passwordLastUpdateInstant": passwordLastUpdateInstant,
        "tenantId": tenantId,
        "twoFactor": twoFactor!.toJson(),
        "usernameStatus": usernameStatus,
        "verified": verified,
      };
}

class TwoFactor {
  TwoFactor();

  factory TwoFactor.fromJson(Map<String, dynamic> json) => TwoFactor();

  Map<String, dynamic> toJson() => {};
}
