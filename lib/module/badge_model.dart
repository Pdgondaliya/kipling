import 'dart:convert';

List<BadgeData> badgeFromJson(String str) =>
    List<BadgeData>.from(json.decode(str).map((x) => BadgeData.fromJson(x)));

String badgeToJson(List<BadgeData> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BadgeData {
  BadgeData({
    this.id,
    this.rewardTemplateId,
    this.voucherType,
    this.discountType,
    this.discountValue,
    this.availableForSalesItems,
    this.combinable,
    this.availableForServicesFee,
    this.minSpend,
    this.maxSpend,
    this.availableForVat,
    this.outputType,
    this.partner,
    this.redemptionText,
    this.redemptionUrl,
    this.voucherTemplate,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
    this.redemptionImage,
    this.csvFile,
    this.productCategories,
    this.redeemLocations,
    this.contents,
    this.voucherCategories,
  });

  int? id;
  String? rewardTemplateId;
  dynamic voucherType;
  dynamic discountType;
  dynamic discountValue;
  dynamic availableForSalesItems;
  dynamic combinable;
  dynamic availableForServicesFee;
  dynamic minSpend;
  dynamic maxSpend;
  dynamic availableForVat;
  dynamic outputType;
  dynamic partner;
  dynamic redemptionText;
  dynamic redemptionUrl;
  VoucherTemplate? voucherTemplate;
  dynamic createdBy;
  UpdatedBy? updatedBy;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic redemptionImage;
  dynamic csvFile;
  List<dynamic>? productCategories;
  List<dynamic>? redeemLocations;
  List<Content>? contents;
  List<dynamic>? voucherCategories;

  factory BadgeData.fromJson(Map<String, dynamic> json) => BadgeData(
        id: json["id"],
        rewardTemplateId: json["reward_template_id"],
        voucherType: json["voucher_type"],
        discountType: json["discount_type"],
        discountValue: json["discount_value"],
        availableForSalesItems: json["available_for_sales_items"],
        combinable: json["combinable"],
        availableForServicesFee: json["available_for_services_fee"],
        minSpend: json["min_spend"],
        maxSpend: json["max_spend"],
        availableForVat: json["available_for_vat"],
        outputType: json["output_type"],
        partner: json["partner"],
        redemptionText: json["RedemptionText"],
        redemptionUrl: json["RedemptionUrl"],
        voucherTemplate: VoucherTemplate.fromJson(json["voucher_template"]),
        createdBy: json["created_by"],
        updatedBy: UpdatedBy.fromJson(json["updated_by"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        redemptionImage: json["RedemptionImage"],
        csvFile: json["csv_file"],
        productCategories:
            List<dynamic>.from(json["product_categories"].map((x) => x)),
        redeemLocations:
            List<dynamic>.from(json["redeem_locations"].map((x) => x)),
        contents: List<Content>.from(
            json["contents"].map((x) => Content.fromJson(x))).toList(),
        voucherCategories:
            List<dynamic>.from(json["voucher_categories"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "reward_template_id": rewardTemplateId,
        "voucher_type": voucherType,
        "discount_type": discountType,
        "discount_value": discountValue,
        "available_for_sales_items": availableForSalesItems,
        "combinable": combinable,
        "available_for_services_fee": availableForServicesFee,
        "min_spend": minSpend,
        "max_spend": maxSpend,
        "available_for_vat": availableForVat,
        "output_type": outputType,
        "partner": partner,
        "RedemptionText": redemptionText,
        "RedemptionUrl": redemptionUrl,
        "voucher_template": voucherTemplate!.toJson(),
        "created_by": createdBy,
        "updated_by": updatedBy!.toJson(),
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "RedemptionImage": redemptionImage,
        "csv_file": csvFile,
        "product_categories":
            List<dynamic>.from(productCategories!.map((x) => x)),
        "redeem_locations": List<dynamic>.from(redeemLocations!.map((x) => x)),
        "contents": List<dynamic>.from(contents!.map((x) => x.toJson())),
        "voucher_categories":
            List<dynamic>.from(voucherCategories!.map((x) => x)),
      };
}

class Content {
  Content({
    this.id,
    this.title,
    this.description,
    this.conditions,
    this.state,
    this.rewardTemplateId,
    this.voucherLanguage,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
    this.images,
  });

  int? id;
  String? title;
  String? description;
  String? conditions;
  String? state;
  String? rewardTemplateId;
  int? voucherLanguage;
  dynamic createdBy;
  dynamic updatedBy;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<ImageModel>? images;

  factory Content.fromJson(Map<String, dynamic> json) => Content(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        conditions: json["conditions"],
        state: json["state"],
        rewardTemplateId: json["reward_template_id"],
        voucherLanguage: json["voucher_language"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        images: List<ImageModel>.from(json["images"].map((x) => ImageModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "conditions": conditions,
        "state": state,
        "reward_template_id": rewardTemplateId,
        "voucher_language": voucherLanguage,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "images": List<dynamic>.from(images!.map((x) => x.toJson())),
      };

}

class ImageModel {
  ImageModel({
    this.id,
    this.name,
    this.alternativeText,
    this.caption,
    this.width,
    this.height,
    this.formats,
    this.hash,
    this.ext,
    this.mime,
    this.size,
    this.url,
    this.previewUrl,
    this.provider,
    this.providerMetadata,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? name;
  dynamic alternativeText;
  dynamic caption;
  int? width;
  int? height;
  Formats? formats;
  String? hash;
  String? ext;
  String? mime;
  double? size;
  String? url;
  dynamic previewUrl;
  String? provider;
  dynamic providerMetadata;
  dynamic createdBy;
  dynamic updatedBy;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory ImageModel.fromJson(Map<String, dynamic> json) => ImageModel(
        id: json["id"],
        name: json["name"],
        alternativeText: json["alternativeText"],
        caption: json["caption"],
        width: json["width"],
        height: json["height"],
        formats: Formats.fromJson(json["formats"]),
        hash: json["hash"],
        ext: json["ext"],
        mime: json["mime"],
        size: json["size"].toDouble(),
        url: json["url"],
        previewUrl: json["previewUrl"],
        provider: json["provider"],
        providerMetadata: json["provider_metadata"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "alternativeText": alternativeText,
        "caption": caption,
        "width": width,
        "height": height,
        "formats": formats!.toJson(),
        "hash": hash,
        "ext": ext,
        "mime": mime,
        "size": size,
        "url": url,
        "previewUrl": previewUrl,
        "provider": provider,
        "provider_metadata": providerMetadata,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };
}

class Formats {
  Formats({
    this.thumbnail,
  });

  Thumbnail? thumbnail;

  factory Formats.fromJson(Map<String, dynamic> json) => Formats(
        thumbnail: Thumbnail.fromJson(json["thumbnail"]),
      );

  Map<String, dynamic> toJson() => {
        "thumbnail": thumbnail!.toJson(),
      };
}

class Thumbnail {
  Thumbnail({
    this.ext,
    this.url,
    this.hash,
    this.mime,
    this.name,
    this.path,
    this.size,
    this.width,
    this.height,
  });

  String? ext;
  String? url;
  String? hash;
  String? mime;
  String? name;
  dynamic path;
  double? size;
  int? width;
  int? height;

  factory Thumbnail.fromJson(Map<String, dynamic> json) => Thumbnail(
        ext: json["ext"],
        url: json["url"],
        hash: json["hash"],
        mime: json["mime"],
        name: json["name"],
        path: json["path"],
        size: json["size"].toDouble(),
        width: json["width"],
        height: json["height"],
      );

  Map<String, dynamic> toJson() => {
        "ext": ext,
        "url": url,
        "hash": hash,
        "mime": mime,
        "name": name,
        "path": path,
        "size": size,
        "width": width,
        "height": height,
      };
}

class UpdatedBy {
  UpdatedBy({
    this.id,
    this.firstname,
    this.lastname,
    this.username,
  });

  int? id;
  String? firstname;
  String? lastname;
  dynamic username;

  factory UpdatedBy.fromJson(Map<String, dynamic> json) => UpdatedBy(
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

class VoucherTemplate {
  VoucherTemplate({
    this.id,
    this.name,
    this.type,
    this.validityType,
    this.validityEndDate,
    this.active,
    this.maxIssuanceCount,
    this.maxRedemptionCount,
    this.pointsNeeded,
    this.descriptions,
    this.validityRelativeDaysFromCreation,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
    this.rewardTemplateId,
  });

  int? id;
  String? name;
  int? type;
  int? validityType;
  dynamic validityEndDate;
  bool? active;
  int? maxIssuanceCount;
  int? maxRedemptionCount;
  int? pointsNeeded;
  String? descriptions;
  int? validityRelativeDaysFromCreation;
  int? createdBy;
  int? updatedBy;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? rewardTemplateId;

  factory VoucherTemplate.fromJson(Map<String, dynamic> json) =>
      VoucherTemplate(
        id: json["id"],
        name: json["name"],
        type: json["type"],
        validityType: json["validity_type"],
        validityEndDate: json["validity_end_date"],
        active: json["active"],
        maxIssuanceCount: json["max_issuance_count"],
        maxRedemptionCount: json["max_redemption_count"],
        pointsNeeded: json["points_needed"],
        descriptions: json["descriptions"],
        validityRelativeDaysFromCreation:
            json["validity_relative_days_from_creation"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        rewardTemplateId: json["reward_template_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "type": type,
        "validity_type": validityType,
        "validity_end_date": validityEndDate,
        "active": active,
        "max_issuance_count": maxIssuanceCount,
        "max_redemption_count": maxRedemptionCount,
        "points_needed": pointsNeeded,
        "descriptions": descriptions,
        "validity_relative_days_from_creation":
            validityRelativeDaysFromCreation,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "reward_template_id": rewardTemplateId,
      };
}
