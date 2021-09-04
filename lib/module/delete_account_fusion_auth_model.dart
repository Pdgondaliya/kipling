// To parse this JSON data, do
//
//     final deleteFusionAuthAccountModel = deleteFusionAuthAccountModelFromJson(jsonString);

import 'dart:convert';

DeleteFusionAuthAccountModel deleteFusionAuthAccountModelFromJson(String str) =>
    DeleteFusionAuthAccountModel.fromJson(json.decode(str));

String deleteFusionAuthAccountModelToJson(DeleteFusionAuthAccountModel data) =>
    json.encode(data.toJson());

class DeleteFusionAuthAccountModel {
  DeleteFusionAuthAccountModel({
    this.user,
  });

  User? user;

  factory DeleteFusionAuthAccountModel.fromJson(Map<String, dynamic> json) =>
      DeleteFusionAuthAccountModel(
        user: json["user"] == null ? null : User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "user": user == null ? null : user!.toJson(),
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
        active: json["active"] == null ? null : json["active"],
        connectorId: json["connectorId"] == null ? null : json["connectorId"],
        email: json["email"] == null ? null : json["email"],
        encryptionScheme:
            json["encryptionScheme"] == null ? null : json["encryptionScheme"],
        id: json["id"] == null ? null : json["id"],
        insertInstant:
            json["insertInstant"] == null ? null : json["insertInstant"],
        lastLoginInstant:
            json["lastLoginInstant"] == null ? null : json["lastLoginInstant"],
        lastUpdateInstant: json["lastUpdateInstant"] == null
            ? null
            : json["lastUpdateInstant"],
        passwordChangeRequired: json["passwordChangeRequired"] == null
            ? null
            : json["passwordChangeRequired"],
        passwordLastUpdateInstant: json["passwordLastUpdateInstant"] == null
            ? null
            : json["passwordLastUpdateInstant"],
        tenantId: json["tenantId"] == null ? null : json["tenantId"],
        twoFactor: json["twoFactor"] == null
            ? null
            : TwoFactor.fromJson(json["twoFactor"]),
        usernameStatus:
            json["usernameStatus"] == null ? null : json["usernameStatus"],
        verified: json["verified"] == null ? null : json["verified"],
      );

  Map<String, dynamic> toJson() => {
        "active": active == null ? null : active,
        "connectorId": connectorId == null ? null : connectorId,
        "email": email == null ? null : email,
        "encryptionScheme": encryptionScheme == null ? null : encryptionScheme,
        "id": id == null ? null : id,
        "insertInstant": insertInstant == null ? null : insertInstant,
        "lastLoginInstant": lastLoginInstant == null ? null : lastLoginInstant,
        "lastUpdateInstant":
            lastUpdateInstant == null ? null : lastUpdateInstant,
        "passwordChangeRequired":
            passwordChangeRequired == null ? null : passwordChangeRequired,
        "passwordLastUpdateInstant": passwordLastUpdateInstant == null
            ? null
            : passwordLastUpdateInstant,
        "tenantId": tenantId == null ? null : tenantId,
        "twoFactor": twoFactor == null ? null : twoFactor!.toJson(),
        "usernameStatus": usernameStatus == null ? null : usernameStatus,
        "verified": verified == null ? null : verified,
      };
}

class TwoFactor {
  TwoFactor();

  factory TwoFactor.fromJson(Map<String, dynamic> json) => TwoFactor();

  Map<String, dynamic> toJson() => {};
}
