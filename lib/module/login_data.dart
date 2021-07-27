// To parse this JSON data, do
//
//     final logindata = logindataFromJson(jsonString);

import 'dart:convert';

List<Logindata> logindataFromJson(String str) =>
    List<Logindata>.from(json.decode(str).map((x) => Logindata.fromJson(x)));

String logindataToJson(List<Logindata> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Logindata {
  Logindata({
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
  List<Value> value;
  AtedBy createdBy;
  AtedBy updatedBy;
  String createdAt;
  String updatedAt;

  factory Logindata.fromJson(Map<String, dynamic> json) => Logindata(
        id: json["id"],
        name: json["name"],
        value: List<Value>.from(json["value"].map((x) => Value.fromJson(x))),
        createdBy: AtedBy.fromJson(json["created_by"]),
        updatedBy: AtedBy.fromJson(json["updated_by"]),
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "value": List<dynamic>.from(value.map((x) => x.toJson())),
        "created_by": createdBy.toJson(),
        "updated_by": updatedBy.toJson(),
        "created_at": createdAt,
        "updated_at": updatedAt,
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

class Value {
  Value({
    required this.emailText,
    required this.bgImageUrl,
    required this.languageCode,
    required this.passwordText,
    required this.registerText,
    required this.logoImageUrl,
    required this.logInButtonText,
    required this.registerLinkText,
    required this.forgotPasswordText,
    required this.emailPlaceholderText,
    required this.passwordPlaceholderText,
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
  String emailPlaceholderText;
  String passwordPlaceholderText;

  factory Value.fromJson(Map<String, dynamic> json) => Value(
        emailText: json["email_text"],
        bgImageUrl: json["bg_image_url"],
        languageCode: json["language_code"],
        passwordText: json["password_text"],
        registerText: json["register_text"],
        logoImageUrl: json["logo_image_url"],
        logInButtonText: json["log_in_button_text"],
        registerLinkText: json["register_link_text"],
        forgotPasswordText: json["forgot_password_text"],
        emailPlaceholderText: json["email_placeholder_text"],
        passwordPlaceholderText: json["password_placeholder_text"],
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
        "email_placeholder_text": emailPlaceholderText,
        "password_placeholder_text": passwordPlaceholderText,
      };
}
