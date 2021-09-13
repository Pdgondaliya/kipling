import 'dart:convert';

List<MyAccountDetailsModel> myAccountDetailsModelFromJson(String str) => List<MyAccountDetailsModel>.from(json.decode(str).map((x) => MyAccountDetailsModel.fromJson(x)));

String myAccountDetailsModelToJson(List<MyAccountDetailsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MyAccountDetailsModel {
  MyAccountDetailsModel({
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
  MyAccountValue? value;
  AtedBy? createdBy;
  AtedBy? updatedBy;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory MyAccountDetailsModel.fromJson(Map<String, dynamic> json) => MyAccountDetailsModel(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    value: json["value"] == null ? null : MyAccountValue.fromJson(json["value"]),
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
    username: json["username"] == null ? null : json["username"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "firstname": firstname == null ? null : firstname,
    "lastname": lastname == null ? null : lastname,
    "username": username == null ? null : username,
  };
}

class MyAccountValue {
  MyAccountValue({
    this.tabs,
    this.savingTarget,
    this.titleTextEn,
    this.titleTextNl,
    this.loyaltyCardType,
    this.loyaltyCardBgImageUrl,
    this.savingDescriptionTextEn,
    this.savingDescriptionTextNl,
    this.loyaltyCardCustomerNameVisible,
    this.loyaltyCardIdentifierNumberVisible,
  });

  List<Tab>? tabs;
  int? savingTarget;
  String? titleTextEn;
  String? titleTextNl;
  String? loyaltyCardType;
  String? loyaltyCardBgImageUrl;
  String? savingDescriptionTextEn;
  String? savingDescriptionTextNl;
  bool? loyaltyCardCustomerNameVisible;
  bool? loyaltyCardIdentifierNumberVisible;

  factory MyAccountValue.fromJson(Map<String, dynamic> json) => MyAccountValue(
    tabs: json["tabs"] == null ? null : List<Tab>.from(json["tabs"].map((x) => Tab.fromJson(x))),
    savingTarget: json["saving_target"] == null ? null : json["saving_target"],
    titleTextEn: json["title_text_en"] == null ? null : json["title_text_en"],
    titleTextNl: json["title_text_nl"] == null ? null : json["title_text_nl"],
    loyaltyCardType: json["loyalty_card_type"] == null ? null : json["loyalty_card_type"],
    loyaltyCardBgImageUrl: json["loyalty_card_bg_image_url"] == null ? null : json["loyalty_card_bg_image_url"],
    savingDescriptionTextEn: json["saving_description_text_en"] == null ? null : json["saving_description_text_en"],
    savingDescriptionTextNl: json["saving_description_text_nl"] == null ? null : json["saving_description_text_nl"],
    loyaltyCardCustomerNameVisible: json["loyalty_card_customer_name_visible"] == null ? null : json["loyalty_card_customer_name_visible"],
    loyaltyCardIdentifierNumberVisible: json["loyalty_card_identifier_number_visible"] == null ? null : json["loyalty_card_identifier_number_visible"],
  );

  Map<String, dynamic> toJson() => {
    "tabs": tabs == null ? null : List<dynamic>.from(tabs!.map((x) => x.toJson())),
    "saving_target": savingTarget == null ? null : savingTarget,
    "title_text_en": titleTextEn == null ? null : titleTextEn,
    "title_text_nl": titleTextNl == null ? null : titleTextNl,
    "loyalty_card_type": loyaltyCardType == null ? null : loyaltyCardType,
    "loyalty_card_bg_image_url": loyaltyCardBgImageUrl == null ? null : loyaltyCardBgImageUrl,
    "saving_description_text_en": savingDescriptionTextEn == null ? null : savingDescriptionTextEn,
    "saving_description_text_nl": savingDescriptionTextNl == null ? null : savingDescriptionTextNl,
    "loyalty_card_customer_name_visible": loyaltyCardCustomerNameVisible == null ? null : loyaltyCardCustomerNameVisible,
    "loyalty_card_identifier_number_visible": loyaltyCardIdentifierNumberVisible == null ? null : loyaltyCardIdentifierNumberVisible,
  };
}

class Tab {
  Tab({
    this.sortid,
    this.enabled,
    this.textEn,
    this.textNl,
    this.redirectUrl,
  });

  int? sortid;
  bool? enabled;
  String? textEn;
  String? textNl;
  String? redirectUrl;

  factory Tab.fromJson(Map<String, dynamic> json) => Tab(
    sortid: json["sortid"] == null ? null : json["sortid"],
    enabled: json["enabled"] == null ? null : json["enabled"],
    textEn: json["text_en"] == null ? null : json["text_en"],
    textNl: json["text_nl"] == null ? null : json["text_nl"],
    redirectUrl: json["redirect_url"] == null ? null : json["redirect_url"],
  );

  Map<String, dynamic> toJson() => {
    "sortid": sortid == null ? null : sortid,
    "enabled": enabled == null ? null : enabled,
    "text_en": textEn == null ? null : textEn,
    "text_nl": textNl == null ? null : textNl,
    "redirect_url": redirectUrl == null ? null : redirectUrl,
  };
}
