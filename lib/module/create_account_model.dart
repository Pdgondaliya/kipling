// To parse this JSON data, do
//
//     final createAccountModel = createAccountModelFromJson(jsonString);

import 'dart:convert';

List<CreateAccountModel> createAccountModelFromJson(String str) => List<CreateAccountModel>.from(json.decode(str).map((x) => CreateAccountModel.fromJson(x)));

String createAccountModelToJson(List<CreateAccountModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CreateAccountModel {
  CreateAccountModel({
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
  Value value;
  AtedBy createdBy;
  AtedBy updatedBy;
  DateTime createdAt;
  DateTime updatedAt;

  factory CreateAccountModel.fromJson(Map<String, dynamic> json) => CreateAccountModel(
    id: json["id"],
    name: json["name"],
    value: Value.fromJson(json["value"]),
    createdBy: AtedBy.fromJson(json["created_by"]),
    updatedBy: AtedBy.fromJson(json["updated_by"]),
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "value": value.toJson(),
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

class Value {
  Value({
    required this.fields,
    required this.loginTextEn,
    required this.loginTextNl,
    required this.titleTextEn,
    required this.titleTextNl,
    required this.loginLinkTextEn,
    required this.loginLinkTextNl,
  });

  Fields fields;
  String loginTextEn;
  String loginTextNl;
  String titleTextEn;
  String titleTextNl;
  String loginLinkTextEn;
  String loginLinkTextNl;

  factory Value.fromJson(Map<String, dynamic> json) => Value(
    fields: Fields.fromJson(json["fields"]),
    loginTextEn: json["login_text_en"],
    loginTextNl: json["login_text_nl"],
    titleTextEn: json["title_text_en"],
    titleTextNl: json["title_text_nl"],
    loginLinkTextEn: json["login_link_text_en"],
    loginLinkTextNl: json["login_link_text_nl"],
  );

  Map<String, dynamic> toJson() => {
    "fields": fields.toJson(),
    "login_text_en": loginTextEn,
    "login_text_nl": loginTextNl,
    "title_text_en": titleTextEn,
    "title_text_nl": titleTextNl,
    "login_link_text_en": loginLinkTextEn,
    "login_link_text_nl": loginLinkTextNl,
  };
}

class Fields {
  Fields({
    required this.name,
    required this.optin,
    required this.signUp,
    required this.password,
    required this.lastName,
    required this.birthDate,
    required this.middleName,
    required this.emailAddress,
    required this.confirmPassword,
    required this.generalPermission,
  });

  BirthDate name;
  GeneralPermission optin;
  GeneralPermission signUp;
  BirthDate password;
  BirthDate lastName;
  BirthDate birthDate;
  BirthDate middleName;
  BirthDate emailAddress;
  BirthDate confirmPassword;
  GeneralPermission generalPermission;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
    name: BirthDate.fromJson(json["name"]),
    optin: GeneralPermission.fromJson(json["optin"]),
    signUp: GeneralPermission.fromJson(json["sign_up"]),
    password: BirthDate.fromJson(json["password"]),
    lastName: BirthDate.fromJson(json["last_name"]),
    birthDate: BirthDate.fromJson(json["birth_date"]),
    middleName: BirthDate.fromJson(json["middle_name"]),
    emailAddress: BirthDate.fromJson(json["email_address"]),
    confirmPassword: BirthDate.fromJson(json["confirm_password"]),
    generalPermission: GeneralPermission.fromJson(json["general_permission"]),
  );

  Map<String, dynamic> toJson() => {
    "name": name.toJson(),
    "optin": optin.toJson(),
    "sign_up": signUp.toJson(),
    "password": password.toJson(),
    "last_name": lastName.toJson(),
    "birth_date": birthDate.toJson(),
    "middle_name": middleName.toJson(),
    "email_address": emailAddress.toJson(),
    "confirm_password": confirmPassword.toJson(),
    "general_permission": generalPermission.toJson(),
  };
}

class BirthDate {
  BirthDate({
    required this.type,
    required this.visible,
    required this.required,
    required this.titleTextEn,
    required this.titleTextNl,
    required this.placeholderTextEn,
    required this.placeholderTextNl,
  });

  String type;
  bool visible;
  bool required;
  String titleTextEn;
  String titleTextNl;
  String placeholderTextEn;
  String placeholderTextNl;

  factory BirthDate.fromJson(Map<String, dynamic> json) => BirthDate(
    type: json["type"],
    visible: json["visible"],
    required: json["required"],
    titleTextEn: json["title_text_en"],
    titleTextNl: json["title_text_nl"],
    placeholderTextEn: json["placeholder_text_en"],
    placeholderTextNl: json["placeholder_text_nl"],
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "visible": visible,
    "required": required,
    "title_text_en": titleTextEn,
    "title_text_nl": titleTextNl,
    "placeholder_text_en": placeholderTextEn,
    "placeholder_text_nl": placeholderTextNl,
  };
}

class GeneralPermission {
  GeneralPermission({
    required this.type,
    required this.visible,
    this.requiredField,
    required this.titleTextEn,
    required this.titleTextNl,
  });

  String type;
  bool visible;
  bool? requiredField;
  String titleTextEn;
  String titleTextNl;

  factory GeneralPermission.fromJson(Map<String, dynamic> json) => GeneralPermission(
    type: json["type"],
    visible: json["visible"],
    requiredField: json["required"],
    titleTextEn: json["title_text_en"],
    titleTextNl: json["title_text_nl"],
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "visible": visible,
    "required": requiredField,
    "title_text_en": titleTextEn,
    "title_text_nl": titleTextNl,
  };
}
