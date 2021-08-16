// To parse this JSON data, do
//
//     final voucherRewardModel = voucherRewardModelFromJson(jsonString);

import 'dart:convert';

VoucherRewardModel voucherRewardModelFromJson(String str) => VoucherRewardModel.fromJson(json.decode(str));

String voucherRewardModelToJson(VoucherRewardModel data) => json.encode(data.toJson());

class VoucherRewardModel {
  VoucherRewardModel({
    this.page,
    this.itemsPerPage,
    this.totalItems,
    this.items,
  });

  int? page;
  int? itemsPerPage;
  int? totalItems;
  List<Item>? items;

  factory VoucherRewardModel.fromJson(Map<String, dynamic> json) => VoucherRewardModel(
    page: json["page"],
    itemsPerPage: json["items_per_page"],
    totalItems: json["total_items"],
    items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "page": page,
    "items_per_page": itemsPerPage,
    "total_items": totalItems,
    "items": List<dynamic>.from(items!.map((x) => x.toJson())),
  };
}

class Item {
  Item({
    this.id,
    this.rewardTemplateId,
    this.customerId,
    this.type,
    this.code,
    this.commitCode,
    this.state,
    this.createdAt,
    this.updatedAt,
    this.redeemedAt,
    this.expirationDate,
    this.validityRelativeDaysFromCreation,
    this.rewardTemplate,
    this.source,
    this.sourceId,
    this.sourceType,
  });

  String? id;
  String? rewardTemplateId;
  String? customerId;
  String? type;
  String? code;
  String? commitCode;
  String? state;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic? redeemedAt;
  DateTime? expirationDate;
  int? validityRelativeDaysFromCreation;
  RewardTemplate? rewardTemplate;
  String? source;
  String? sourceId;
  String? sourceType;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    id: json["id"],
    rewardTemplateId: json["reward_template_id"],
    customerId: json["customer_id"],
    type: json["type"],
    code: json["code"],
    commitCode: json["commit_code"],
    state: json["state"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    redeemedAt: json["redeemed_at"],
    expirationDate: DateTime.parse(json["expiration_date"]),
    validityRelativeDaysFromCreation: json["validity_relative_days_from_creation"],
    rewardTemplate: RewardTemplate.fromJson(json["reward_template"]),
    source: json["source"],
    sourceId: json["source_id"],
    sourceType: json["source_type"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "reward_template_id": rewardTemplateId,
    "customer_id": customerId,
    "type": type,
    "code": code,
    "commit_code": commitCode,
    "state": state,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
    "redeemed_at": redeemedAt,
    "expiration_date": expirationDate!.toIso8601String(),
    "validity_relative_days_from_creation": validityRelativeDaysFromCreation,
    "reward_template": rewardTemplate!.toJson(),
    "source": source,
    "source_id": sourceId,
    "source_type": sourceType,
  };
}

class RewardTemplate {
  RewardTemplate({
    this.id,
    this.name,
    this.descriptions,
    this.type,
    this.validityType,
    this.validityEndDate,
    this.validityRelativeDaysFromCreation,
    this.maxRedemptionCount,
    this.pointsNeeded,
    this.defaultLanguageCode,
    this.active,
    this.maxIssuanceCount,
    this.visibleFrom,
    this.visibleTo,
    this.visibleSegmentId,
    this.createdAt,
    this.updatedAt,
    this.validated,
  });

  String? id;
  String? name;
  String? descriptions;
  String? type;
  String? validityType;
  dynamic? validityEndDate;
  int? validityRelativeDaysFromCreation;
  int? maxRedemptionCount;
  int? pointsNeeded;
  String? defaultLanguageCode;
  bool? active;
  int? maxIssuanceCount;
  dynamic? visibleFrom;
  dynamic? visibleTo;
  String? visibleSegmentId;
  DateTime? createdAt;
  DateTime? updatedAt;
  bool? validated;

  factory RewardTemplate.fromJson(Map<String, dynamic> json) => RewardTemplate(
    id: json["id"],
    name: json["name"],
    descriptions: json["descriptions"],
    type: json["type"],
    validityType: json["validity_type"],
    validityEndDate: json["validity_end_date"],
    validityRelativeDaysFromCreation: json["validity_relative_days_from_creation"],
    maxRedemptionCount: json["max_redemption_count"],
    pointsNeeded: json["points_needed"],
    defaultLanguageCode: json["default_language_code"],
    active: json["active"],
    maxIssuanceCount: json["max_issuance_count"],
    visibleFrom: json["visible_from"],
    visibleTo: json["visible_to"],
    visibleSegmentId: json["visible_segment_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    validated: json["validated"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "descriptions": descriptions,
    "type": type,
    "validity_type": validityType,
    "validity_end_date": validityEndDate,
    "validity_relative_days_from_creation": validityRelativeDaysFromCreation,
    "max_redemption_count": maxRedemptionCount,
    "points_needed": pointsNeeded,
    "default_language_code": defaultLanguageCode,
    "active": active,
    "max_issuance_count": maxIssuanceCount,
    "visible_from": visibleFrom,
    "visible_to": visibleTo,
    "visible_segment_id": visibleSegmentId,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
    "validated": validated,
  };
}
