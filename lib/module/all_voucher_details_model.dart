// To parse this JSON data, do
//
//     final allVoucherDetailsModel = allVoucherDetailsModelFromJson(jsonString);

import 'dart:convert';

AllVoucherDetailsModel allVoucherDetailsModelFromJson(String str) => AllVoucherDetailsModel.fromJson(json.decode(str));

String allVoucherDetailsModelToJson(AllVoucherDetailsModel data) => json.encode(data.toJson());

class AllVoucherDetailsModel {
  AllVoucherDetailsModel({
    this.page,
    this.itemsPerPage,
    this.totalItems,
    this.items,
  });

  int? page;
  int? itemsPerPage;
  int? totalItems;
  List<Item>? items;

  factory AllVoucherDetailsModel.fromJson(Map<String, dynamic> json) => AllVoucherDetailsModel(
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
  String? validityEndDate;
  int? validityRelativeDaysFromCreation;
  int? maxRedemptionCount;
  int? pointsNeeded;
  String? defaultLanguageCode;
  bool? active;
  int? maxIssuanceCount;
  String? visibleFrom;
  String? visibleTo;
  String? visibleSegmentId;
  DateTime? createdAt;
  DateTime? updatedAt;
  bool? validated;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
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
