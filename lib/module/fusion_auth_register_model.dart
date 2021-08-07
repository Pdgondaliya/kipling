// To parse this JSON data, do
//
//     final fusionAuthRegisterModel = fusionAuthRegisterModelFromJson(jsonString);

import 'dart:convert';

FusionAuthRegisterModel fusionAuthRegisterModelFromJson(String str) => FusionAuthRegisterModel.fromJson(json.decode(str));

String fusionAuthRegisterModelToJson(FusionAuthRegisterModel data) => json.encode(data.toJson());

class FusionAuthRegisterModel {
  FusionAuthRegisterModel({
    this.user,
  });

  User? user;

  factory FusionAuthRegisterModel.fromJson(Map<String, dynamic> json) => FusionAuthRegisterModel(
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "user": user!.toJson(),
  };
}

class User {
  User({
    this.active,
    this.connectorId,
    this.email,
    this.encryptionScheme,
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
  String? encryptionScheme;
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
    encryptionScheme: json["encryptionScheme"],
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
    "encryptionScheme": encryptionScheme,
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

  factory TwoFactor.fromJson(Map<String, dynamic> json) => TwoFactor(
  );

  Map<String, dynamic> toJson() => {
  };
}
