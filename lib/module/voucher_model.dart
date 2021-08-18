// To parse this JSON data, do
//
//     final voucherModel = voucherModelFromJson(jsonString);

import 'dart:convert';

List<VoucherModel> voucherModelFromJson(String str) => List<VoucherModel>.from(
    json.decode(str).map((x) => VoucherModel.fromJson(x)));

String voucherModelToJson(List<VoucherModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class VoucherModel {
  VoucherModel({
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
  VoucherValue? value;
  AtedBy? createdBy;
  AtedBy? updatedBy;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory VoucherModel.fromJson(Map<String, dynamic> json) => VoucherModel(
        id: json["id"],
        name: json["name"],
        value: VoucherValue.fromJson(json["value"]),
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

class VoucherValue {
  VoucherValue({
    this.titleTextEn,
    this.titleTextNl,
    this.offerVouchersTextEn,
    this.offerVouchersTextNl,
    this.activatedVouchersTextEn,
    this.activatedVouchersTextNl,
  });

  String? titleTextEn;
  String? titleTextNl;
  String? offerVouchersTextEn;
  String? offerVouchersTextNl;
  String? activatedVouchersTextEn;
  String? activatedVouchersTextNl;

  factory VoucherValue.fromJson(Map<String, dynamic> json) => VoucherValue(
        titleTextEn: json["title_text_en"],
        titleTextNl: json["title_text_nl"],
        offerVouchersTextEn: json["offer_vouchers_text_en"],
        offerVouchersTextNl: json["offer_vouchers_text_nl"],
        activatedVouchersTextEn: json["activated_vouchers_text_en"],
        activatedVouchersTextNl: json["activated_vouchers_text_nl"],
      );

  Map<String, dynamic> toJson() => {
        "title_text_en": titleTextEn,
        "title_text_nl": titleTextNl,
        "offer_vouchers_text_en": offerVouchersTextEn,
        "offer_vouchers_text_nl": offerVouchersTextNl,
        "activated_vouchers_text_en": activatedVouchersTextEn,
        "activated_vouchers_text_nl": activatedVouchersTextNl,
      };
}

class CustomVoucherModel {
  String? image;
  String? title;
  String? subTitle;
  String? point;
  String? conditions;
  String? description;

  CustomVoucherModel(
      {this.image,
      this.title,
      this.subTitle,
      this.point,
      this.description,
      this.conditions});
}
