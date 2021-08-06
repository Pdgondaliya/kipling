import 'dart:convert';

RegisterUserModel registerUserModelFromJson(String str) =>
    RegisterUserModel.fromJson(json.decode(str));

String registerUserModelToJson(RegisterUserModel data) =>
    json.encode(data.toJson());

class RegisterUserModel {
  RegisterUserModel({
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
  List<dynamic>? phoneNumbers;
  List<dynamic>? addresses;
  List<dynamic>? subscriptions;
  String? avatarUrl;
  List<dynamic>? externalIdentifiers;
  List<dynamic>? programIdentifiers;
  List<dynamic>? tags;
  List<dynamic>? integerCustomFields;
  List<dynamic>? stringCustomFields;
  List<dynamic>? booleanCustomFields;
  List<dynamic>? dateTimeCustomFields;
  List<dynamic>? floatCustomFields;
  DateTime? createdAt;
  DateTime? updatedAt;
  bool? isDeleted;
  dynamic deletedAt;
  int? transactionCount;

  factory RegisterUserModel.fromJson(Map<String, dynamic> json) =>
      RegisterUserModel(
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
        initials: json["initials"] == null ? null : json["initials"],
        name: json["name"] == null ? null : json["name"],
        middleName: json["middle_name"] == null ? null : json["middle_name"],
        lastName: json["last_name"] == null ? null : json["last_name"],
        gender: json["gender"] == null ? null : json["gender"],
        birthDate: json["birth_date"] == null
            ? null
            : DateTime.parse(json["birth_date"]),
        birthPlace: json["birth_place"] == null ? null : json["birth_place"],
        countryCode: json["country_code"] == null ? null : json["country_code"],
        languageCode:
            json["language_code"] == null ? null : json["language_code"],
        tier: json["tier"] == null ? null : json["tier"],
        optin: json["optin"] == null ? null : json["optin"],
        generalPermission: json["general_permission"] == null
            ? null
            : json["general_permission"],
        balance:
            json["balance"] == null ? null : Balance.fromJson(json["balance"]),
        emails: json["emails"] == null
            ? null
            : List<Email>.from(json["emails"].map((x) => Email.fromJson(x))),
        phoneNumbers: json["phone_numbers"] == null
            ? null
            : List<dynamic>.from(json["phone_numbers"].map((x) => x)),
        addresses: json["addresses"] == null
            ? null
            : List<dynamic>.from(json["addresses"].map((x) => x)),
        subscriptions: json["subscriptions"] == null
            ? null
            : List<dynamic>.from(json["subscriptions"].map((x) => x)),
        avatarUrl: json["avatar_url"] == null ? null : json["avatar_url"],
        externalIdentifiers: json["external_identifiers"] == null
            ? null
            : List<dynamic>.from(json["external_identifiers"].map((x) => x)),
        programIdentifiers: json["program_identifiers"] == null
            ? null
            : List<dynamic>.from(json["program_identifiers"].map((x) => x)),
        tags: json["tags"] == null
            ? null
            : List<dynamic>.from(json["tags"].map((x) => x)),
        integerCustomFields: json["integer_custom_fields"] == null
            ? null
            : List<dynamic>.from(json["integer_custom_fields"].map((x) => x)),
        stringCustomFields: json["string_custom_fields"] == null
            ? null
            : List<dynamic>.from(json["string_custom_fields"].map((x) => x)),
        booleanCustomFields: json["boolean_custom_fields"] == null
            ? null
            : List<dynamic>.from(json["boolean_custom_fields"].map((x) => x)),
        dateTimeCustomFields: json["date_time_custom_fields"] == null
            ? null
            : List<dynamic>.from(json["date_time_custom_fields"].map((x) => x)),
        floatCustomFields: json["float_custom_fields"] == null
            ? null
            : List<dynamic>.from(json["float_custom_fields"].map((x) => x)),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        isDeleted: json["is_deleted"] == null ? null : json["is_deleted"],
        deletedAt: json["deleted_at"],
        transactionCount: json["transaction_count"] == null
            ? null
            : json["transaction_count"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "title": title == null ? null : title,
        "initials": initials == null ? null : initials,
        "name": name == null ? null : name,
        "middle_name": middleName == null ? null : middleName,
        "last_name": lastName == null ? null : lastName,
        "gender": gender == null ? null : gender,
        "birth_date": birthDate == null ? null : birthDate!.toIso8601String(),
        "birth_place": birthPlace == null ? null : birthPlace,
        "country_code": countryCode == null ? null : countryCode,
        "language_code": languageCode == null ? null : languageCode,
        "tier": tier == null ? null : tier,
        "optin": optin == null ? null : optin,
        "general_permission":
            generalPermission == null ? null : generalPermission,
        "balance": balance == null ? null : balance!.toJson(),
        "emails": emails == null
            ? null
            : List<dynamic>.from(emails!.map((x) => x.toJson())),
        "phone_numbers": phoneNumbers == null
            ? null
            : List<dynamic>.from(phoneNumbers!.map((x) => x)),
        "addresses": addresses == null
            ? null
            : List<dynamic>.from(addresses!.map((x) => x)),
        "subscriptions": subscriptions == null
            ? null
            : List<dynamic>.from(subscriptions!.map((x) => x)),
        "avatar_url": avatarUrl == null ? null : avatarUrl,
        "external_identifiers": externalIdentifiers == null
            ? null
            : List<dynamic>.from(externalIdentifiers!.map((x) => x)),
        "program_identifiers": programIdentifiers == null
            ? null
            : List<dynamic>.from(programIdentifiers!.map((x) => x)),
        "tags": tags == null ? null : List<dynamic>.from(tags!.map((x) => x)),
        "integer_custom_fields": integerCustomFields == null
            ? null
            : List<dynamic>.from(integerCustomFields!.map((x) => x)),
        "string_custom_fields": stringCustomFields == null
            ? null
            : List<dynamic>.from(stringCustomFields!.map((x) => x)),
        "boolean_custom_fields": booleanCustomFields == null
            ? null
            : List<dynamic>.from(booleanCustomFields!.map((x) => x)),
        "date_time_custom_fields": dateTimeCustomFields == null
            ? null
            : List<dynamic>.from(dateTimeCustomFields!.map((x) => x)),
        "float_custom_fields": floatCustomFields == null
            ? null
            : List<dynamic>.from(floatCustomFields!.map((x) => x)),
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "is_deleted": isDeleted == null ? null : isDeleted,
        "deleted_at": deletedAt,
        "transaction_count": transactionCount == null ? null : transactionCount,
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
        id: json["id"] == null ? null : json["id"],
        customerId: json["customer_id"] == null ? null : json["customer_id"],
        points: json["points"] == null ? null : json["points"],
        previousPoints:
            json["previous_points"] == null ? null : json["previous_points"],
        totalPositivePoints: json["total_positive_points"] == null
            ? null
            : json["total_positive_points"],
        totalNegativePoints: json["total_negative_points"] == null
            ? null
            : json["total_negative_points"],
        totalEventPositivePoints: json["total_event_positive_points"] == null
            ? null
            : json["total_event_positive_points"],
        totalEventNegativePoints: json["total_event_negative_points"] == null
            ? null
            : json["total_event_negative_points"],
        totalManualPositivePoints: json["total_manual_positive_points"] == null
            ? null
            : json["total_manual_positive_points"],
        totalManualNegativePoints: json["total_manual_negative_points"] == null
            ? null
            : json["total_manual_negative_points"],
        totalRewardPositivePoints: json["total_reward_positive_points"] == null
            ? null
            : json["total_reward_positive_points"],
        totalRewardNegativePoints: json["total_reward_negative_points"] == null
            ? null
            : json["total_reward_negative_points"],
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        balanceUpdates: json["balance_updates"] == null
            ? null
            : List<dynamic>.from(json["balance_updates"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "customer_id": customerId == null ? null : customerId,
        "points": points == null ? null : points,
        "previous_points": previousPoints == null ? null : previousPoints,
        "total_positive_points":
            totalPositivePoints == null ? null : totalPositivePoints,
        "total_negative_points":
            totalNegativePoints == null ? null : totalNegativePoints,
        "total_event_positive_points":
            totalEventPositivePoints == null ? null : totalEventPositivePoints,
        "total_event_negative_points":
            totalEventNegativePoints == null ? null : totalEventNegativePoints,
        "total_manual_positive_points": totalManualPositivePoints == null
            ? null
            : totalManualPositivePoints,
        "total_manual_negative_points": totalManualNegativePoints == null
            ? null
            : totalManualNegativePoints,
        "total_reward_positive_points": totalRewardPositivePoints == null
            ? null
            : totalRewardPositivePoints,
        "total_reward_negative_points": totalRewardNegativePoints == null
            ? null
            : totalRewardNegativePoints,
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "balance_updates": balanceUpdates == null
            ? null
            : List<dynamic>.from(balanceUpdates!.map((x) => x)),
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
        id: json["id"] == null ? null : json["id"],
        type: json["type"] == null ? null : json["type"],
        emailAddress:
            json["email_address"] == null ? null : json["email_address"],
        verified: json["verified"] == null ? null : json["verified"],
        primary: json["primary"] == null ? null : json["primary"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "type": type == null ? null : type,
        "email_address": emailAddress == null ? null : emailAddress,
        "verified": verified == null ? null : verified,
        "primary": primary == null ? null : primary,
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
      };
}
