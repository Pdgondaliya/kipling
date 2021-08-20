// To parse this JSON data, do
//
//     final getUserDataModel = getUserDataModelFromJson(jsonString);

import 'dart:convert';

GetUserDataModel getUserDataModelFromJson(String str) =>
    GetUserDataModel.fromJson(json.decode(str));

String getUserDataModelToJson(GetUserDataModel data) =>
    json.encode(data.toJson());

class GetUserDataModel {
  GetUserDataModel({
    this.id,
    this.title,
    this.initials,
    this.name,
    this.middleName,
    this.lastName,
    this.gender,
    this.birthDate,
    this.birthPlace,
    this.countryCode,
    this.languageCode,
    this.tier,
    this.optin,
    this.generalPermission,
    this.balance,
    this.emails,
    this.phoneNumbers,
    this.addresses,
    this.subscriptions,
    this.avatarUrl,
    this.externalIdentifiers,
    this.programIdentifiers,
    this.tags,
    this.integerCustomFields,
    this.stringCustomFields,
    this.booleanCustomFields,
    this.dateTimeCustomFields,
    this.floatCustomFields,
    this.createdAt,
    this.updatedAt,
    this.isDeleted,
    this.deletedAt,
    this.transactionCount,
  });

  String? id;
  String? title;
  String? initials;
  String? name;
  String? middleName;
  String? lastName;
  String? gender;
  DateTime? birthDate;
  String? birthPlace;
  String? countryCode;
  String? languageCode;
  String? tier;
  bool? optin;
  bool? generalPermission;
  Balance? balance;
  List<Email>? emails;
  List<PhoneNumber>? phoneNumbers;
  List<Address>? addresses;
  List<dynamic>? subscriptions;
  String? avatarUrl;
  List<dynamic>? externalIdentifiers;
  List<ProgramIdentifier>? programIdentifiers;
  List<dynamic>? tags;
  List<dynamic>? integerCustomFields;
  List<dynamic>? stringCustomFields;
  List<dynamic>? booleanCustomFields;
  List<dynamic>? dateTimeCustomFields;
  List<dynamic>? floatCustomFields;
  DateTime? createdAt;
  DateTime? updatedAt;
  bool? isDeleted;
  dynamic? deletedAt;
  int? transactionCount;

  factory GetUserDataModel.fromJson(Map<String, dynamic> json) =>
      GetUserDataModel(
        id: json["id"],
        title: json["title"],
        initials: json["initials"],
        name: json["name"],
        middleName: json["middle_name"],
        lastName: json["last_name"],
        gender: json["gender"],
        birthDate: DateTime.parse(json["birth_date"]),
        birthPlace: json["birth_place"],
        countryCode: json["country_code"],
        languageCode: json["language_code"],
        tier: json["tier"],
        optin: json["optin"],
        generalPermission: json["general_permission"],
        balance: Balance.fromJson(json["balance"]),
        emails: List<Email>.from(json["emails"].map((x) => Email.fromJson(x))),
        phoneNumbers: List<PhoneNumber>.from(json["phone_numbers"].map((x) => x)),
        addresses: List<Address>.from(json["addresses"].map((x) => x)),
        subscriptions: List<dynamic>.from(json["subscriptions"].map((x) => x)),
        avatarUrl: json["avatar_url"],
        externalIdentifiers:
            List<dynamic>.from(json["external_identifiers"].map((x) => x)),
        programIdentifiers: List<ProgramIdentifier>.from(
            json["program_identifiers"]
                .map((x) => ProgramIdentifier.fromJson(x))),
        tags: List<dynamic>.from(json["tags"].map((x) => x)),
        integerCustomFields:
            List<dynamic>.from(json["integer_custom_fields"].map((x) => x)),
        stringCustomFields:
            List<dynamic>.from(json["string_custom_fields"].map((x) => x)),
        booleanCustomFields:
            List<dynamic>.from(json["boolean_custom_fields"].map((x) => x)),
        dateTimeCustomFields:
            List<dynamic>.from(json["date_time_custom_fields"].map((x) => x)),
        floatCustomFields:
            List<dynamic>.from(json["float_custom_fields"].map((x) => x)),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        isDeleted: json["is_deleted"],
        deletedAt: json["deleted_at"],
        transactionCount: json["transaction_count"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "initials": initials,
        "name": name,
        "middle_name": middleName,
        "last_name": lastName,
        "gender": gender,
        "birth_date": birthDate!.toIso8601String(),
        "birth_place": birthPlace,
        "country_code": countryCode,
        "language_code": languageCode,
        "tier": tier,
        "optin": optin,
        "general_permission": generalPermission,
        "balance": balance!.toJson(),
        "emails": List<dynamic>.from(emails!.map((x) => x.toJson())),
        "phone_numbers": List<dynamic>.from(phoneNumbers!.map((x) => x)),
        "addresses": List<dynamic>.from(addresses!.map((x) => x)),
        "subscriptions": List<dynamic>.from(subscriptions!.map((x) => x)),
        "avatar_url": avatarUrl,
        "external_identifiers":
            List<dynamic>.from(externalIdentifiers!.map((x) => x)),
        "program_identifiers":
            List<dynamic>.from(programIdentifiers!.map((x) => x.toJson())),
        "tags": List<dynamic>.from(tags!.map((x) => x)),
        "integer_custom_fields":
            List<dynamic>.from(integerCustomFields!.map((x) => x)),
        "string_custom_fields":
            List<dynamic>.from(stringCustomFields!.map((x) => x)),
        "boolean_custom_fields":
            List<dynamic>.from(booleanCustomFields!.map((x) => x)),
        "date_time_custom_fields":
            List<dynamic>.from(dateTimeCustomFields!.map((x) => x)),
        "float_custom_fields":
            List<dynamic>.from(floatCustomFields!.map((x) => x)),
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "is_deleted": isDeleted,
        "deleted_at": deletedAt,
        "transaction_count": transactionCount,
      };
}

class Balance {
  Balance({
    this.id,
    this.customerId,
    this.points,
    this.previousPoints,
    this.totalPositivePoints,
    this.totalNegativePoints,
    this.totalEventPositivePoints,
    this.totalEventNegativePoints,
    this.totalManualPositivePoints,
    this.totalManualNegativePoints,
    this.totalRewardPositivePoints,
    this.totalRewardNegativePoints,
    this.updatedAt,
    this.balanceUpdates,
  });

  String? id;
  String? customerId;
  int? points;
  int? previousPoints;
  int? totalPositivePoints;
  int? totalNegativePoints;
  int? totalEventPositivePoints;
  int? totalEventNegativePoints;
  int? totalManualPositivePoints;
  int? totalManualNegativePoints;
  int? totalRewardPositivePoints;
  int? totalRewardNegativePoints;
  DateTime? updatedAt;
  List<dynamic>? balanceUpdates;

  factory Balance.fromJson(Map<String, dynamic> json) => Balance(
        id: json["id"],
        customerId: json["customer_id"],
        points: json["points"],
        previousPoints: json["previous_points"],
        totalPositivePoints: json["total_positive_points"],
        totalNegativePoints: json["total_negative_points"],
        totalEventPositivePoints: json["total_event_positive_points"],
        totalEventNegativePoints: json["total_event_negative_points"],
        totalManualPositivePoints: json["total_manual_positive_points"],
        totalManualNegativePoints: json["total_manual_negative_points"],
        totalRewardPositivePoints: json["total_reward_positive_points"],
        totalRewardNegativePoints: json["total_reward_negative_points"],
        updatedAt: DateTime.parse(json["updated_at"]),
        balanceUpdates:
            List<dynamic>.from(json["balance_updates"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "customer_id": customerId,
        "points": points,
        "previous_points": previousPoints,
        "total_positive_points": totalPositivePoints,
        "total_negative_points": totalNegativePoints,
        "total_event_positive_points": totalEventPositivePoints,
        "total_event_negative_points": totalEventNegativePoints,
        "total_manual_positive_points": totalManualPositivePoints,
        "total_manual_negative_points": totalManualNegativePoints,
        "total_reward_positive_points": totalRewardPositivePoints,
        "total_reward_negative_points": totalRewardNegativePoints,
        "updated_at": updatedAt!.toIso8601String(),
        "balance_updates": List<dynamic>.from(balanceUpdates!.map((x) => x)),
      };
}

class Email {
  Email({
    this.id,
    this.type,
    this.emailAddress,
    this.verified,
    this.primary,
    this.createdAt,
    this.updatedAt,
  });

  String? id;
  String? type;
  String? emailAddress;
  bool? verified;
  bool? primary;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Email.fromJson(Map<String, dynamic> json) => Email(
        id: json["id"],
        type: json["type"],
        emailAddress: json["email_address"],
        verified: json["verified"],
        primary: json["primary"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "email_address": emailAddress,
        "verified": verified,
        "primary": primary,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };
}

class PhoneNumber {
  PhoneNumber({
    this.id,
    this.primary,
    this.type,
    this.countryCode,
    this.number,
    this.createdAt,
    this.updatedAt,
  });

  String? id;
  bool? primary;
  String? type;
  String? countryCode;
  String? number;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory PhoneNumber.fromJson(Map<String, dynamic> json) => PhoneNumber(
    id: json["id"],
    primary: json["primary"],
    type: json["type"],
    countryCode: json["country_code"],
    number: json["number"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "primary": primary,
    "type": type,
    "country_code": countryCode,
    "number": number,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
  };
}

class Address {
  Address({
    this.id,
    this.primary,
    this.type,
    this.addressLine1,
    this.addressLine2,
    this.houseNumber,
    this.houseNumberSuffix,
    this.postalCode,
    this.state,
    this.city,
    this.country,
    this.createdAt,
    this.updatedAt,
  });

  String? id;
  bool? primary;
  String? type;
  String? addressLine1;
  String? addressLine2;
  String? houseNumber;
  String? houseNumberSuffix;
  String? postalCode;
  String? state;
  String? city;
  String? country;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    id: json["id"],
    primary: json["primary"],
    type: json["type"],
    addressLine1: json["address_line_1"],
    addressLine2: json["address_line_2"],
    houseNumber: json["house_number"],
    houseNumberSuffix: json["house_number_suffix"],
    postalCode: json["postal_code"],
    state: json["state"],
    city: json["city"],
    country: json["country"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "primary": primary,
    "type": type,
    "address_line_1": addressLine1,
    "address_line_2": addressLine2,
    "house_number": houseNumber,
    "house_number_suffix": houseNumberSuffix,
    "postal_code": postalCode,
    "state": state,
    "city": city,
    "country": country,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
  };
}

class ProgramIdentifier {
  ProgramIdentifier({
    this.id,
    this.type,
    this.identifier,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.isDeleted,
    this.deletedAt,
  });

  String? id;
  String? type;
  String? identifier;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  bool? isDeleted;
  dynamic? deletedAt;

  factory ProgramIdentifier.fromJson(Map<String, dynamic> json) =>
      ProgramIdentifier(
        id: json["id"],
        type: json["type"],
        identifier: json["identifier"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        isDeleted: json["is_deleted"],
        deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "identifier": identifier,
        "status": status,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "is_deleted": isDeleted,
        "deleted_at": deletedAt,
      };
}
