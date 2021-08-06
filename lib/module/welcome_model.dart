import 'dart:convert';

List<WelComeScreenModel> welComeScreenModelFromJson(String str) => List<WelComeScreenModel>.from(json.decode(str).map((x) => WelComeScreenModel.fromJson(x)));

String welComeScreenModelToJson(List<WelComeScreenModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WelComeScreenModel {
  WelComeScreenModel({
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
  WelComeValue? value;
  AtedBy? createdBy;
  AtedBy? updatedBy;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory WelComeScreenModel.fromJson(Map<String, dynamic> json) => WelComeScreenModel(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    value: json["value"] == null ? null : WelComeValue.fromJson(json["value"]),
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
  dynamic username;

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

class WelComeValue {
  WelComeValue({
    this.bgImageUrl,
    this.titleTextEn,
    this.titleTextNl,
    this.rewardTextEn,
    this.rewardTextNl,
    this.ctaButtonTextEn,
    this.ctaButtonTextNl,
    this.descriptionTextEn,
    this.descriptionTextNl,
    this.profileImagePlaceholderUrl,
  });

  String? bgImageUrl;
  String? titleTextEn;
  String? titleTextNl;
  String? rewardTextEn;
  String? rewardTextNl;
  String? ctaButtonTextEn;
  String? ctaButtonTextNl;
  String? descriptionTextEn;
  String? descriptionTextNl;
  String? profileImagePlaceholderUrl;

  factory WelComeValue.fromJson(Map<String, dynamic> json) => WelComeValue(
    bgImageUrl: json["bg_image_url"] == null ? null : json["bg_image_url"],
    titleTextEn: json["title_text_en"] == null ? null : json["title_text_en"],
    titleTextNl: json["title_text_nl"] == null ? null : json["title_text_nl"],
    rewardTextEn: json["reward_text_en"] == null ? null : json["reward_text_en"],
    rewardTextNl: json["reward_text_nl"] == null ? null : json["reward_text_nl"],
    ctaButtonTextEn: json["cta_button_text_en"] == null ? null : json["cta_button_text_en"],
    ctaButtonTextNl: json["cta_button_text_nl"] == null ? null : json["cta_button_text_nl"],
    descriptionTextEn: json["description_text_en"] == null ? null : json["description_text_en"],
    descriptionTextNl: json["description_text_nl"] == null ? null : json["description_text_nl"],
    profileImagePlaceholderUrl: json["profile_image_placeholder_url"] == null ? null : json["profile_image_placeholder_url"],
  );

  Map<String, dynamic> toJson() => {
    "bg_image_url": bgImageUrl == null ? null : bgImageUrl,
    "title_text_en": titleTextEn == null ? null : titleTextEn,
    "title_text_nl": titleTextNl == null ? null : titleTextNl,
    "reward_text_en": rewardTextEn == null ? null : rewardTextEn,
    "reward_text_nl": rewardTextNl == null ? null : rewardTextNl,
    "cta_button_text_en": ctaButtonTextEn == null ? null : ctaButtonTextEn,
    "cta_button_text_nl": ctaButtonTextNl == null ? null : ctaButtonTextNl,
    "description_text_en": descriptionTextEn == null ? null : descriptionTextEn,
    "description_text_nl": descriptionTextNl == null ? null : descriptionTextNl,
    "profile_image_placeholder_url": profileImagePlaceholderUrl == null ? null : profileImagePlaceholderUrl,
  };
}
