// To parse this JSON data, do
//
//     final logindata = logindataFromJson(jsonString);

import 'dart:convert';

List<Logindata> logindataFromJson(String str) => List<Logindata>.from(json.decode(str).map((x) => Logindata.fromJson(x)));

String logindataToJson(List<Logindata> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Logindata {
  Logindata({
    this.id,
    this.name,
    this.value,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? name;
  List<Value>? value;
  AtedBy? createdBy;
  AtedBy? updatedBy;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Logindata.fromJson(Map<String, dynamic> json) => Logindata(
    id: json["id"],
    name: json["name"],
    value: List<Value>.from(json["value"].map((x) => Value.fromJson(x))),
    createdBy: AtedBy.fromJson(json["created_by"]),
    updatedBy: AtedBy.fromJson(json["updated_by"]),
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "value": List<dynamic>.from(value!.map((x) => x.toJson())),
    "created_by": createdBy!.toJson(),
    "updated_by": updatedBy!.toJson(),
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
  };
}

class AtedBy {
  AtedBy({
    this.id,
    this.firstname,
    this.lastname,
    this.username,
  });

  int? id;
  String? firstname;
  String? lastname;
  dynamic? username;

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
    this.emailText,
    this.bgImageUrl,
    this.languageCode,
    this.passwordText,
    this.registerText,
    this.logoImageUrl,
    this.logInButtonText,
    this.registerLinkText,
    this.forgotPasswordText,
    this.emailPlaceholderText,
    this.fusionauthApplicationId,
    this.passwordPlaceholderText,
  });

  String? emailText;
  String? bgImageUrl;
  String? languageCode;
  String? passwordText;
  String? registerText;
  String? logoImageUrl;
  String? logInButtonText;
  String? registerLinkText;
  String? forgotPasswordText;
  String? emailPlaceholderText;
  String? fusionauthApplicationId;
  String? passwordPlaceholderText;

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
    fusionauthApplicationId: json["fusionauth_application_id"],
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
    "fusionauth_application_id": fusionauthApplicationId,
    "password_placeholder_text": passwordPlaceholderText,
  };
}
