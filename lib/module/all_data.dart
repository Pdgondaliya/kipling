// To parse this JSON data, do
//
//     final alldata = alldataFromJson(jsonString);

import 'dart:convert';

List<Alldata> alldataFromJson(String str) =>
    List<Alldata>.from(json.decode(str).map((x) => Alldata.fromJson(x)));

String alldataToJson(List<Alldata> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Alldata {
  Alldata({
    required this.id,
    required this.name,
    required this.value,
    required this.createdBy,
    required this.updatedBy,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String name;
  dynamic value;
  AtedBy createdBy;
  AtedBy updatedBy;
  DateTime createdAt;
  DateTime updatedAt;

  factory Alldata.fromJson(Map<String, dynamic> json) => Alldata(
        id: json["id"],
        name: json["name"],
        value: json["value"],
        createdBy: AtedBy.fromJson(json["created_by"]),
        updatedBy: AtedBy.fromJson(json["updated_by"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "value": value,
        "created_by": createdBy.toJson(),
        "updated_by": updatedBy.toJson(),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class AtedBy {
  AtedBy({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.username,
  });

  int id;
  String firstname;
  String lastname;
  dynamic username;

  factory AtedBy.fromJson(Map<String, dynamic> json) => AtedBy(
        id: json["id"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        username: json["username"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstname": firstname,
        "lastname": lastname,
        "username": username,
      };
}

class ValueElement {
  ValueElement({
    required this.emailText,
    required this.bgImageUrl,
    required this.languageCode,
    required this.passwordText,
    required this.registerText,
    required this.logoImageUrl,
    required this.logInButtonText,
    required this.registerLinkText,
    required this.forgotPasswordText,
    required this.code,
    required this.name,
  });

  String emailText;
  String bgImageUrl;
  String languageCode;
  String passwordText;
  String registerText;
  String logoImageUrl;
  String logInButtonText;
  String registerLinkText;
  String forgotPasswordText;
  String code;
  String name;

  factory ValueElement.fromJson(Map<String, dynamic> json) => ValueElement(
        emailText: json["email_text"],
        bgImageUrl: json["bg_image_url"],
        languageCode: json["language_code"],
        passwordText: json["password_text"],
        registerText: json["register_text"],
        logoImageUrl: json["logo_image_url"],
        logInButtonText: json["log_in_button_text"],
        registerLinkText: json["register_link_text"],
        forgotPasswordText: json["forgot_password_text"],
        code: json["code"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "email_text": emailText,
        "bg_image_url": bgImageUrl,
        "language_code": languageCode,
        "password_text": passwordText,
        "register_text": registerText,
        "logo_image_url": logoImageUrl,
        "log_in_button_text": logInButtonText,
        "register_link_text": registerLinkText,
        "forgot_password_text": forgotPasswordText,
        "code": code,
        "name": name == null ? null : name,
      };
}

class PurpleValue {
  PurpleValue({
    required this.fontSize,
    required this.fontType,
    required this.clientName,
    required this.bgImageUrl,
    required this.logoImageUrl,
  });

  String fontSize;
  String fontType;
  String clientName;
  String bgImageUrl;
  String logoImageUrl;

  factory PurpleValue.fromJson(Map<String, dynamic> json) => PurpleValue(
        fontSize: json["font_size"],
        fontType: json["font_type"],
        clientName: json["client_name"],
        bgImageUrl: json["bg_image_url"],
        logoImageUrl: json["logo_image_url"],
      );

  Map<String, dynamic> toJson() => {
        "font_size": fontSize,
        "font_type": fontType,
        "client_name": clientName,
        "bg_image_url": bgImageUrl,
        "logo_image_url": logoImageUrl,
      };
}
