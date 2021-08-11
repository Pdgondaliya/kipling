import 'dart:convert';

List<ForgotPasswordModel> forgotPasswordModelFromJson(String str) => List<ForgotPasswordModel>.from(json.decode(str).map((x) => ForgotPasswordModel.fromJson(x)));

String forgotPasswordModelToJson(List<ForgotPasswordModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ForgotPasswordModel {
  ForgotPasswordModel({
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
  Value? value;
  AtedBy? createdBy;
  AtedBy? updatedBy;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory ForgotPasswordModel.fromJson(Map<String, dynamic> json) => ForgotPasswordModel(
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
    "value": value!.toJson(),
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
    this.fields,
    this.titleTextEn,
    this.titleTextNl,
    this.descriptionTextEn,
    this.descriptionTextNl,
  });

  Fields? fields;
  String? titleTextEn;
  String? titleTextNl;
  String? descriptionTextEn;
  String? descriptionTextNl;

  factory Value.fromJson(Map<String, dynamic> json) => Value(
    fields: Fields.fromJson(json["fields"]),
    titleTextEn: json["title_text_en"],
    titleTextNl: json["title_text_nl"],
    descriptionTextEn: json["description_text_en"],
    descriptionTextNl: json["description_text_nl"],
  );

  Map<String, dynamic> toJson() => {
    "fields": fields!.toJson(),
    "title_text_en": titleTextEn,
    "title_text_nl": titleTextNl,
    "description_text_en": descriptionTextEn,
    "description_text_nl": descriptionTextNl,
  };
}

class Fields {
  Fields({
    this.cta,
    this.emailAddress,
  });

  Cta? cta;
  EmailAddress? emailAddress;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
    cta: Cta.fromJson(json["cta"]),
    emailAddress: EmailAddress.fromJson(json["email_address"]),
  );

  Map<String, dynamic> toJson() => {
    "cta": cta!.toJson(),
    "email_address": emailAddress!.toJson(),
  };
}

class Cta {
  Cta({
    this.type,
    this.visible,
    this.titleTextEn,
    this.titleTextNl,
  });

  String? type;
  bool? visible;
  String? titleTextEn;
  String? titleTextNl;

  factory Cta.fromJson(Map<String, dynamic> json) => Cta(
    type: json["type"],
    visible: json["visible"],
    titleTextEn: json["title_text_en"],
    titleTextNl: json["title_text_nl"],
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "visible": visible,
    "title_text_en": titleTextEn,
    "title_text_nl": titleTextNl,
  };
}

class EmailAddress {
  EmailAddress({
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

  factory EmailAddress.fromJson(Map<String, dynamic> json) => EmailAddress(
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
