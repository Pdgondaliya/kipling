// // To parse this JSON data, do
// //
// //     final loginModel = loginModelFromJson(jsonString);
//
// import 'dart:convert';
//
// LoginModel loginModelFromJson(String str) =>
//     LoginModel.fromJson(json.decode(str));
//
// String loginModelToJson(LoginModel data) => json.encode(data.toJson());
//
// class LoginModel {
//   LoginModel({
//     this.token,
//     this.user,
//   });
//
//   String? token;
//   User? user;
//
//   factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
//         token: json["token"],
//         user: User.fromJson(json["user"]),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "token": token,
//         "user": user!.toJson(),
//       };
// }
//
// class User {
//   User({
//     this.active,
//     this.connectorId,
//     this.email,
//     this.firstName,
//     this.id,
//     this.insertInstant,
//     this.lastLoginInstant,
//     this.lastName,
//     this.lastUpdateInstant,
//     this.passwordChangeRequired,
//     this.passwordLastUpdateInstant,
//     this.registrations,
//     this.tenantId,
//     this.twoFactor,
//     this.usernameStatus,
//     this.verified,
//   });
//
//   bool? active;
//   String? connectorId;
//   String? email;
//   String? firstName;
//   String? id;
//   int? insertInstant;
//   int? lastLoginInstant;
//   String? lastName;
//   int? lastUpdateInstant;
//   bool? passwordChangeRequired;
//   int? passwordLastUpdateInstant;
//   List<Registration>? registrations;
//   String? tenantId;
//   TwoFactor? twoFactor;
//   String? usernameStatus;
//   bool? verified;
//
//   factory User.fromJson(Map<String, dynamic> json) => User(
//         active: json["active"],
//         connectorId: json["connectorId"],
//         email: json["email"],
//         firstName: json["firstName"],
//         id: json["id"],
//         insertInstant: json["insertInstant"],
//         lastLoginInstant: json["lastLoginInstant"],
//         lastName: json["lastName"],
//         lastUpdateInstant: json["lastUpdateInstant"],
//         passwordChangeRequired: json["passwordChangeRequired"],
//         passwordLastUpdateInstant: json["passwordLastUpdateInstant"],
//         registrations: List<Registration>.from(
//             json["registrations"].map((x) => Registration.fromJson(x))),
//         tenantId: json["tenantId"],
//         twoFactor: TwoFactor.fromJson(json["twoFactor"]),
//         usernameStatus: json["usernameStatus"],
//         verified: json["verified"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "active": active,
//         "connectorId": connectorId,
//         "email": email,
//         "firstName": firstName,
//         "id": id,
//         "insertInstant": insertInstant,
//         "lastLoginInstant": lastLoginInstant,
//         "lastName": lastName,
//         "lastUpdateInstant": lastUpdateInstant,
//         "passwordChangeRequired": passwordChangeRequired,
//         "passwordLastUpdateInstant": passwordLastUpdateInstant,
//         "registrations":
//             List<dynamic>.from(registrations!.map((x) => x.toJson())),
//         "tenantId": tenantId,
//         "twoFactor": twoFactor!.toJson(),
//         "usernameStatus": usernameStatus,
//         "verified": verified,
//       };
// }
//
// class Registration {
//   Registration({
//     this.applicationId,
//     this.id,
//     this.insertInstant,
//     this.lastLoginInstant,
//     this.lastUpdateInstant,
//     this.usernameStatus,
//     this.verified,
//     this.roles,
//   });
//
//   String? applicationId;
//   String? id;
//   int? insertInstant;
//   int? lastLoginInstant;
//   int? lastUpdateInstant;
//   String? usernameStatus;
//   bool? verified;
//   List<String>? roles;
//
//   factory Registration.fromJson(Map<String, dynamic> json) => Registration(
//         applicationId: json["applicationId"],
//         id: json["id"],
//         insertInstant: json["insertInstant"],
//         lastLoginInstant: json["lastLoginInstant"],
//         lastUpdateInstant: json["lastUpdateInstant"],
//         usernameStatus: json["usernameStatus"],
//         verified: json["verified"],
//         roles: json["roles"] == null
//             ? null
//             : List<String>.from(json["roles"].map((x) => x)),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "applicationId": applicationId,
//         "id": id,
//         "insertInstant": insertInstant,
//         "lastLoginInstant": lastLoginInstant,
//         "lastUpdateInstant": lastUpdateInstant,
//         "usernameStatus": usernameStatus,
//         "verified": verified,
//         "roles":
//             roles == null ? null : List<dynamic>.from(roles!.map((x) => x)),
//       };
// }
//
// class TwoFactor {
//   TwoFactor();
//
//   factory TwoFactor.fromJson(Map<String, dynamic> json) => TwoFactor();
//
//   Map<String, dynamic> toJson() => {};
// }

// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    this.token,
    this.user,
  });

  String? token;
  User? user;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    token: json["token"] == null ? null : json["token"],
    user: json["user"] == null ? null : User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "token": token == null ? null : token,
    "user": user == null ? null : user!.toJson(),
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
    this.mobilePhone,
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
  String? mobilePhone;
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
    id: json["id"] == null ? null : json["id"],
    insertInstant: json["insertInstant"] == null ? null : json["insertInstant"],
    lastLoginInstant: json["lastLoginInstant"] == null ? null : json["lastLoginInstant"],
    lastUpdateInstant: json["lastUpdateInstant"] == null ? null : json["lastUpdateInstant"],
    mobilePhone: json["mobilePhone"] == null ? null : json["mobilePhone"],
    passwordChangeRequired: json["passwordChangeRequired"] == null ? null : json["passwordChangeRequired"],
    passwordLastUpdateInstant: json["passwordLastUpdateInstant"] == null ? null : json["passwordLastUpdateInstant"],
    tenantId: json["tenantId"] == null ? null : json["tenantId"],
    twoFactor: json["twoFactor"] == null ? null : TwoFactor.fromJson(json["twoFactor"]),
    usernameStatus: json["usernameStatus"] == null ? null : json["usernameStatus"],
    verified: json["verified"] == null ? null : json["verified"],
  );

  Map<String, dynamic> toJson() => {
    "active": active == null ? null : active,
    "connectorId": connectorId == null ? null : connectorId,
    "email": email == null ? null : email,
    "id": id == null ? null : id,
    "insertInstant": insertInstant == null ? null : insertInstant,
    "lastLoginInstant": lastLoginInstant == null ? null : lastLoginInstant,
    "lastUpdateInstant": lastUpdateInstant == null ? null : lastUpdateInstant,
    "mobilePhone": mobilePhone == null ? null : mobilePhone,
    "passwordChangeRequired": passwordChangeRequired == null ? null : passwordChangeRequired,
    "passwordLastUpdateInstant": passwordLastUpdateInstant == null ? null : passwordLastUpdateInstant,
    "tenantId": tenantId == null ? null : tenantId,
    "twoFactor": twoFactor == null ? null : twoFactor!.toJson(),
    "usernameStatus": usernameStatus == null ? null : usernameStatus,
    "verified": verified == null ? null : verified,
  };
}

class TwoFactor {
  TwoFactor();

  factory TwoFactor.fromJson(Map<String, dynamic> json) => TwoFactor(
  );

  Map<String, dynamic> toJson() => {
  };
}
