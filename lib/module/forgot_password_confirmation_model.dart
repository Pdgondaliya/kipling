import 'dart:convert';

List<ForgotPasswordConfirmationModel> forgotPasswordConfirmationModelFromJson(String str) => List<ForgotPasswordConfirmationModel>.from(json.decode(str).map((x) => ForgotPasswordConfirmationModel.fromJson(x)));

String forgotPasswordConfirmationModelToJson(List<ForgotPasswordConfirmationModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ForgotPasswordConfirmationModel {
  ForgotPasswordConfirmationModel({
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

  factory ForgotPasswordConfirmationModel.fromJson(Map<String, dynamic> json) => ForgotPasswordConfirmationModel(
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
    this.titleTextEn,
    this.titleTextNl,
    this.ctaButtonTextEn,
    this.ctaButtonTextNl,
    this.descriptionTextEn,
    this.descriptionTextNl,
  });

  String? titleTextEn;
  String? titleTextNl;
  String? ctaButtonTextEn;
  String? ctaButtonTextNl;
  String? descriptionTextEn;
  String? descriptionTextNl;

  factory Value.fromJson(Map<String, dynamic> json) => Value(
    titleTextEn: json["title_text_en"],
    titleTextNl: json["title_text_nl"],
    ctaButtonTextEn: json["cta_button_text_en"],
    ctaButtonTextNl: json["cta_button_text_nl"],
    descriptionTextEn: json["description_text_en"],
    descriptionTextNl: json["description_text_nl"],
  );

  Map<String, dynamic> toJson() => {
    "title_text_en": titleTextEn,
    "title_text_nl": titleTextNl,
    "cta_button_text_en": ctaButtonTextEn,
    "cta_button_text_nl": ctaButtonTextNl,
    "description_text_en": descriptionTextEn,
    "description_text_nl": descriptionTextNl,
  };
}
