// To parse this JSON data, do
//
//     final deleteDataPageResponse = deleteDataPageResponseFromJson(jsonString);

import 'dart:convert';

List<DeleteDataPageResponse> deleteDataPageResponseFromJson(String str) => List<DeleteDataPageResponse>.from(json.decode(str).map((x) => DeleteDataPageResponse.fromJson(x)));

String deleteDataPageResponseToJson(List<DeleteDataPageResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DeleteDataPageResponse {
  DeleteDataPageResponse({
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
  DeleteValue? value;
  AtedBy? createdBy;
  AtedBy? updatedBy;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory DeleteDataPageResponse.fromJson(Map<String, dynamic> json) => DeleteDataPageResponse(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    value: json["value"] == null ? null : DeleteValue.fromJson(json["value"]),
    createdBy: json["created_by"] == null ? null : AtedBy.fromJson(json["created_by"]),
    updatedBy: json["updated_by"] == null ? null : AtedBy.fromJson(json["updated_by"]),
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "name": name == null ? null : name,
    "value": value == null ? null : value!.toJson(),
    "created_by": createdBy == null ? null : createdBy!.toJson(),
    "updated_by": updatedBy == null ? null : updatedBy!.toJson(),
    "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
    "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
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
  String? username;

  factory AtedBy.fromJson(Map<String, dynamic> json) => AtedBy(
    id: json["id"] == null ? null : json["id"],
    firstname: json["firstname"] == null ? null : json["firstname"],
    lastname: json["lastname"] == null ? null : json["lastname"],
    username: json["username"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "firstname": firstname == null ? null : firstname,
    "lastname": lastname == null ? null : lastname,
    "username": username,
  };
}

class DeleteValue {
  DeleteValue({
    this.fields,
    this.titleTextEn,
    this.titleTextNl,
    this.ctaButtonTextEn,
    this.ctaButtonTextNl,
    this.descriptionTextEn,
    this.descriptionTextNl,
  });

  Fields? fields;
  String? titleTextEn;
  String? titleTextNl;
  String? ctaButtonTextEn;
  String? ctaButtonTextNl;
  String? descriptionTextEn;
  String? descriptionTextNl;

  factory DeleteValue.fromJson(Map<String, dynamic> json) => DeleteValue(
    fields: json["fields"] == null ? null : Fields.fromJson(json["fields"]),
    titleTextEn: json["title_text_en"] == null ? null : json["title_text_en"],
    titleTextNl: json["title_text_nl"] == null ? null : json["title_text_nl"],
    ctaButtonTextEn: json["cta_button_text_en"] == null ? null : json["cta_button_text_en"],
    ctaButtonTextNl: json["cta_button_text_nl"] == null ? null : json["cta_button_text_nl"],
    descriptionTextEn: json["description_text_en"] == null ? null : json["description_text_en"],
    descriptionTextNl: json["description_text_nl"] == null ? null : json["description_text_nl"],
  );

  Map<String, dynamic> toJson() => {
    "fields": fields == null ? null : fields!.toJson(),
    "title_text_en": titleTextEn == null ? null : titleTextEn,
    "title_text_nl": titleTextNl == null ? null : titleTextNl,
    "cta_button_text_en": ctaButtonTextEn == null ? null : ctaButtonTextEn,
    "cta_button_text_nl": ctaButtonTextNl == null ? null : ctaButtonTextNl,
    "description_text_en": descriptionTextEn == null ? null : descriptionTextEn,
    "description_text_nl": descriptionTextNl == null ? null : descriptionTextNl,
  };
}

class Fields {
  Fields({
    this.password,
    this.generalPermission,
  });

  Password? password;
  GeneralPermission? generalPermission;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
    password: json["password"] == null ? null : Password.fromJson(json["password"]),
    generalPermission: json["general_permission"] == null ? null : GeneralPermission.fromJson(json["general_permission"]),
  );

  Map<String, dynamic> toJson() => {
    "password": password == null ? null : password!.toJson(),
    "general_permission": generalPermission == null ? null : generalPermission!.toJson(),
  };
}

class GeneralPermission {
  GeneralPermission({
    this.type,
    this.visible,
    this.required,
    this.titleTextEn,
    this.titleTextNl,
  });

  String? type;
  bool? visible;
  bool? required;
  String? titleTextEn;
  String? titleTextNl;

  factory GeneralPermission.fromJson(Map<String, dynamic> json) => GeneralPermission(
    type: json["type"] == null ? null : json["type"],
    visible: json["visible"] == null ? null : json["visible"],
    required: json["required"] == null ? null : json["required"],
    titleTextEn: json["title_text_en"] == null ? null : json["title_text_en"],
    titleTextNl: json["title_text_nl"] == null ? null : json["title_text_nl"],
  );

  Map<String, dynamic> toJson() => {
    "type": type == null ? null : type,
    "visible": visible == null ? null : visible,
    "required": required == null ? null : required,
    "title_text_en": titleTextEn == null ? null : titleTextEn,
    "title_text_nl": titleTextNl == null ? null : titleTextNl,
  };
}

class Password {
  Password({
    this.type,
    this.visible,
    this.required,
    this.titleTextEn,
    this.titleTextNl,
    this.placeholderTextEn,
    this.placeholderTextNl,
  });

  String? type;
  bool? visible;
  bool? required;
  String? titleTextEn;
  String? titleTextNl;
  String? placeholderTextEn;
  String? placeholderTextNl;

  factory Password.fromJson(Map<String, dynamic> json) => Password(
    type: json["type"] == null ? null : json["type"],
    visible: json["visible"] == null ? null : json["visible"],
    required: json["required"] == null ? null : json["required"],
    titleTextEn: json["title_text_en"] == null ? null : json["title_text_en"],
    titleTextNl: json["title_text_nl"] == null ? null : json["title_text_nl"],
    placeholderTextEn: json["placeholder_text_en"] == null ? null : json["placeholder_text_en"],
    placeholderTextNl: json["placeholder_text_nl"] == null ? null : json["placeholder_text_nl"],
  );

  Map<String, dynamic> toJson() => {
    "type": type == null ? null : type,
    "visible": visible == null ? null : visible,
    "required": required == null ? null : required,
    "title_text_en": titleTextEn == null ? null : titleTextEn,
    "title_text_nl": titleTextNl == null ? null : titleTextNl,
    "placeholder_text_en": placeholderTextEn == null ? null : placeholderTextEn,
    "placeholder_text_nl": placeholderTextNl == null ? null : placeholderTextNl,
  };
}
