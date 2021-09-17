// To parse this JSON data, do
//
//     final tabBarModel = tabBarModelFromJson(jsonString);

import 'dart:convert';

List<TabBarModel> tabBarModelFromJson(String str) => List<TabBarModel>.from(json.decode(str).map((x) => TabBarModel.fromJson(x)));

String tabBarModelToJson(List<TabBarModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TabBarModel {
  TabBarModel({
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
  TabBarValue? value;
  AtedBy? createdBy;
  AtedBy? updatedBy;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory TabBarModel.fromJson(Map<String, dynamic> json) => TabBarModel(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    value: json["value"] == null ? null : TabBarValue.fromJson(json["value"]),
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

class TabBarValue {
  TabBarValue({
    this.tabs,
  });

  List<Tab>? tabs;

  factory TabBarValue.fromJson(Map<String, dynamic> json) => TabBarValue(
    tabs: json["tabs"] == null ? null : List<Tab>.from(json["tabs"].map((x) => Tab.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "tabs": tabs == null ? null : List<dynamic>.from(tabs!.map((x) => x.toJson())),
  };
}

class Tab {
  Tab({
    this.icon,
    this.sortid,
    this.enabled,
    this.textEn,
    this.textNl,
    this.redirectUrl,
  });

  String? icon;
  int? sortid;
  bool? enabled;
  String? textEn;
  String? textNl;
  String? redirectUrl;

  factory Tab.fromJson(Map<String, dynamic> json) => Tab(
    icon: json["icon"] == null ? null : json["icon"],
    sortid: json["sortid"] == null ? null : json["sortid"],
    enabled: json["enabled"] == null ? null : json["enabled"],
    textEn: json["text_en"] == null ? null : json["text_en"],
    textNl: json["text_nl"] == null ? null : json["text_nl"],
    redirectUrl: json["redirect_url"] == null ? null : json["redirect_url"],
  );

  Map<String, dynamic> toJson() => {
    "icon": icon == null ? null : icon,
    "sortid": sortid == null ? null : sortid,
    "enabled": enabled == null ? null : enabled,
    "text_en": textEn == null ? null : textEn,
    "text_nl": textNl == null ? null : textNl,
    "redirect_url": redirectUrl == null ? null : redirectUrl,
  };
}
