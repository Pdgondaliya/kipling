// To parse this JSON data, do
//
//     final prticularVoucherDetails = prticularVoucherDetailsFromJson(jsonString);

import 'dart:convert';

List<ParticularVoucherDetails> particularVoucherDetailsFromJson(String str) => List<ParticularVoucherDetails>.from(json.decode(str).map((x) => ParticularVoucherDetails.fromJson(x)));

String prticularVoucherDetailsToJson(List<ParticularVoucherDetails> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ParticularVoucherDetails {
  ParticularVoucherDetails({
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
  VoucherLanguage? voucherLanguage;
  dynamic? createdBy;
  dynamic? updatedBy;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<Image>? images;

  factory ParticularVoucherDetails.fromJson(Map<String, dynamic> json) => ParticularVoucherDetails(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    conditions: json["conditions"],
    state: json["state"],
    rewardTemplateId: json["reward_template_id"],
    voucherLanguage: VoucherLanguage.fromJson(json["voucher_language"]),
    createdBy: json["created_by"],
    updatedBy: json["updated_by"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "conditions": conditions,
    "state": state,
    "reward_template_id": rewardTemplateId,
    "voucher_language": voucherLanguage!.toJson(),
    "created_by": createdBy,
    "updated_by": updatedBy,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
    "images": List<dynamic>.from(images!.map((x) => x.toJson())),
  };
}

class Image {
  Image({
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
  dynamic? alternativeText;
  dynamic? caption;
  int? width;
  int? height;
  Formats? formats;
  String? hash;
  String? ext;
  String? mime;
  double? size;
  String? url;
  dynamic? previewUrl;
  String? provider;
  dynamic? providerMetadata;
  dynamic? createdBy;
  dynamic? updatedBy;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
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
    this.small,
    this.thumbnail,
  });

  Small? small;
  Small? thumbnail;

  factory Formats.fromJson(Map<String, dynamic> json) => Formats(
    small: Small.fromJson(json["small"]),
    thumbnail: Small.fromJson(json["thumbnail"]),
  );

  Map<String, dynamic> toJson() => {
    "small": small!.toJson(),
    "thumbnail": thumbnail!.toJson(),
  };
}

class Small {
  Small({
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
  dynamic? path;
  double? size;
  int? width;
  int? height;

  factory Small.fromJson(Map<String, dynamic> json) => Small(
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

class VoucherLanguage {
  VoucherLanguage({
    this.id,
    this.name,
    this.code,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? name;
  String? code;
  int? createdBy;
  int? updatedBy;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory VoucherLanguage.fromJson(Map<String, dynamic> json) => VoucherLanguage(
    id: json["id"],
    name: json["name"],
    code: json["code"],
    createdBy: json["created_by"],
    updatedBy: json["updated_by"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "code": code,
    "created_by": createdBy,
    "updated_by": updatedBy,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
  };
}
