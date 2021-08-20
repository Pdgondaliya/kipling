// To parse this JSON data, do
//
//     final uploadImageModel = uploadImageModelFromJson(jsonString);

import 'dart:convert';

List<UploadImageModel> uploadImageModelFromJson(String str) => List<UploadImageModel>.from(json.decode(str).map((x) => UploadImageModel.fromJson(x)));

String uploadImageModelToJson(List<UploadImageModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UploadImageModel {
  UploadImageModel({
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
    this.related,
  });

  int? id;
  String? name;
  String? alternativeText;
  String? caption;
  int? width;
  int? height;
  Formats? formats;
  String? hash;
  String? ext;
  String? mime;
  double? size;
  String? url;
  String? previewUrl;
  String? provider;
  String? providerMetadata;
  dynamic? createdBy;
  dynamic? updatedBy;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<dynamic>? related;

  factory UploadImageModel.fromJson(Map<String, dynamic> json) => UploadImageModel(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    alternativeText: json["alternativeText"],
    caption: json["caption"],
    width: json["width"] == null ? null : json["width"],
    height: json["height"] == null ? null : json["height"],
    formats: json["formats"] == null ? null : Formats.fromJson(json["formats"]),
    hash: json["hash"] == null ? null : json["hash"],
    ext: json["ext"] == null ? null : json["ext"],
    mime: json["mime"] == null ? null : json["mime"],
    size: json["size"] == null ? null : json["size"].toDouble(),
    url: json["url"] == null ? null : json["url"],
    previewUrl: json["previewUrl"],
    provider: json["provider"] == null ? null : json["provider"],
    providerMetadata: json["provider_metadata"],
    createdBy: json["created_by"],
    updatedBy: json["updated_by"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    related: json["related"] == null ? null : List<dynamic>.from(json["related"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "name": name == null ? null : name,
    "alternativeText": alternativeText,
    "caption": caption,
    "width": width == null ? null : width,
    "height": height == null ? null : height,
    "formats": formats == null ? null : formats!.toJson(),
    "hash": hash == null ? null : hash,
    "ext": ext == null ? null : ext,
    "mime": mime == null ? null : mime,
    "size": size == null ? null : size,
    "url": url == null ? null : url,
    "previewUrl": previewUrl,
    "provider": provider == null ? null : provider,
    "provider_metadata": providerMetadata,
    "created_by": createdBy,
    "updated_by": updatedBy,
    "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
    "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
    "related": related == null ? null : List<dynamic>.from(related!.map((x) => x)),
  };
}

class Formats {
  Formats({
    this.large,
    this.small,
    this.medium,
    this.thumbnail,
  });

  Large? large;
  Large? small;
  Large? medium;
  Large? thumbnail;

  factory Formats.fromJson(Map<String, dynamic> json) => Formats(
    large: json["large"] == null ? null : Large.fromJson(json["large"]),
    small: json["small"] == null ? null : Large.fromJson(json["small"]),
    medium: json["medium"] == null ? null : Large.fromJson(json["medium"]),
    thumbnail: json["thumbnail"] == null ? null : Large.fromJson(json["thumbnail"]),
  );

  Map<String, dynamic> toJson() => {
    "large": large == null ? null : large!.toJson(),
    "small": small == null ? null : small!.toJson(),
    "medium": medium == null ? null : medium!.toJson(),
    "thumbnail": thumbnail == null ? null : thumbnail!.toJson(),
  };
}

class Large {
  Large({
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
  String? path;
  double? size;
  int? width;
  int? height;

  factory Large.fromJson(Map<String, dynamic> json) => Large(
    ext: json["ext"] == null ? null : json["ext"],
    url: json["url"] == null ? null : json["url"],
    hash: json["hash"] == null ? null : json["hash"],
    mime: json["mime"] == null ? null : json["mime"],
    name: json["name"] == null ? null : json["name"],
    path: json["path"] == null ? null : json["path"],
    size: json["size"] == null ? null : json["size"].toDouble(),
    width: json["width"] == null ? null : json["width"],
    height: json["height"] == null ? null : json["height"],
  );

  Map<String, dynamic> toJson() => {
    "ext": ext == null ? null : ext,
    "url": url == null ? null : url,
    "hash": hash == null ? null : hash,
    "mime": mime == null ? null : mime,
    "name": name == null ? null : name,
    "path": path == null ? null : path,
    "size": size == null ? null : size,
    "width": width == null ? null : width,
    "height": height == null ? null : height,
  };
}
