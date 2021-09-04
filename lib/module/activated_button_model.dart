// To parse this JSON data, do
//
//     final activatedOfferButtonResonse = activatedOfferButtonResonseFromJson(jsonString);

import 'dart:convert';

ActivatedOfferButtonResponse activatedOfferButtonResponseFromJson(String str) =>
    ActivatedOfferButtonResponse.fromJson(json.decode(str));

String activatedOfferButtonResponseToJson(ActivatedOfferButtonResponse data) =>
    json.encode(data.toJson());

class ActivatedOfferButtonResponse {
  ActivatedOfferButtonResponse({
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

  factory ActivatedOfferButtonResponse.fromJson(Map<String, dynamic> json) =>
      ActivatedOfferButtonResponse(
        id: json["id"] == null ? null : json["id"],
        rewardTemplateId: json["reward_template_id"] == null
            ? null
            : json["reward_template_id"],
        customerId: json["customer_id"] == null ? null : json["customer_id"],
        type: json["type"] == null ? null : json["type"],
        code: json["code"] == null ? null : json["code"],
        commitCode: json["commit_code"] == null ? null : json["commit_code"],
        state: json["state"] == null ? null : json["state"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        redeemedAt: json["redeemed_at"],
        expirationDate: json["expiration_date"] == null
            ? null
            : DateTime.parse(json["expiration_date"]),
        validityRelativeDaysFromCreation:
            json["validity_relative_days_from_creation"] == null
                ? null
                : json["validity_relative_days_from_creation"],
        rewardTemplate: json["reward_template"] == null
            ? null
            : RewardTemplate.fromJson(json["reward_template"]),
        source: json["source"] == null ? null : json["source"],
        sourceId: json["source_id"] == null ? null : json["source_id"],
        sourceType: json["source_type"] == null ? null : json["source_type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "reward_template_id":
            rewardTemplateId == null ? null : rewardTemplateId,
        "customer_id": customerId == null ? null : customerId,
        "type": type == null ? null : type,
        "code": code == null ? null : code,
        "commit_code": commitCode == null ? null : commitCode,
        "state": state == null ? null : state,
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "redeemed_at": redeemedAt,
        "expiration_date":
            expirationDate == null ? null : expirationDate!.toIso8601String(),
        "validity_relative_days_from_creation":
            validityRelativeDaysFromCreation == null
                ? null
                : validityRelativeDaysFromCreation,
        "reward_template":
            rewardTemplate == null ? null : rewardTemplate!.toJson(),
        "source": source == null ? null : source,
        "source_id": sourceId == null ? null : sourceId,
        "source_type": sourceType == null ? null : sourceType,
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
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        descriptions:
            json["descriptions"] == null ? null : json["descriptions"],
        type: json["type"] == null ? null : json["type"],
        validityType:
            json["validity_type"] == null ? null : json["validity_type"],
        validityEndDate: json["validity_end_date"],
        validityRelativeDaysFromCreation:
            json["validity_relative_days_from_creation"] == null
                ? null
                : json["validity_relative_days_from_creation"],
        maxRedemptionCount: json["max_redemption_count"] == null
            ? null
            : json["max_redemption_count"],
        pointsNeeded:
            json["points_needed"] == null ? null : json["points_needed"],
        defaultLanguageCode: json["default_language_code"] == null
            ? null
            : json["default_language_code"],
        active: json["active"] == null ? null : json["active"],
        maxIssuanceCount: json["max_issuance_count"] == null
            ? null
            : json["max_issuance_count"],
        visibleFrom: json["visible_from"],
        visibleTo: json["visible_to"],
        visibleSegmentId: json["visible_segment_id"] == null
            ? null
            : json["visible_segment_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        validated: json["validated"] == null ? null : json["validated"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "descriptions": descriptions == null ? null : descriptions,
        "type": type == null ? null : type,
        "validity_type": validityType == null ? null : validityType,
        "validity_end_date": validityEndDate,
        "validity_relative_days_from_creation":
            validityRelativeDaysFromCreation == null
                ? null
                : validityRelativeDaysFromCreation,
        "max_redemption_count":
            maxRedemptionCount == null ? null : maxRedemptionCount,
        "points_needed": pointsNeeded == null ? null : pointsNeeded,
        "default_language_code":
            defaultLanguageCode == null ? null : defaultLanguageCode,
        "active": active == null ? null : active,
        "max_issuance_count":
            maxIssuanceCount == null ? null : maxIssuanceCount,
        "visible_from": visibleFrom,
        "visible_to": visibleTo,
        "visible_segment_id":
            visibleSegmentId == null ? null : visibleSegmentId,
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "validated": validated == null ? null : validated,
      };
}

ActivatedOfferButtonErrorResponse activatedOfferButtonErrorResponseFromJson(
        String str) =>
    ActivatedOfferButtonErrorResponse.fromJson(json.decode(str));

String activatedOfferButtonErrorResponseToJson(
        ActivatedOfferButtonErrorResponse data) =>
    json.encode(data.toJson());

class ActivatedOfferButtonErrorResponse {
  ActivatedOfferButtonErrorResponse({
    this.code,
    this.message,
    this.details,
  });

  int? code;
  String? message;
  List<dynamic>? details;

  factory ActivatedOfferButtonErrorResponse.fromJson(
          Map<String, dynamic> json) =>
      ActivatedOfferButtonErrorResponse(
        code: json["code"] == null ? null : json["code"],
        message: json["message"] == null ? null : json["message"],
        details: json["details"] == null
            ? null
            : List<dynamic>.from(json["details"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "code": code == null ? null : code,
        "message": message == null ? null : message,
        "details":
            details == null ? null : List<dynamic>.from(details!.map((x) => x)),
      };
}
