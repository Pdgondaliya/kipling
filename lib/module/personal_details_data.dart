// To parse this JSON data, do
//
//     final personalDetailData = personalDetailDataFromJson(jsonString);

import 'dart:convert';

List<PersonalDetailData> personalDetailDataFromJson(String str) => List<PersonalDetailData>.from(json.decode(str).map((x) => PersonalDetailData.fromJson(x)));

String personalDetailDataToJson(List<PersonalDetailData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PersonalDetailData {
  PersonalDetailData({
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
  Value? value;
  AtedBy? createdBy;
  AtedBy? updatedBy;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory PersonalDetailData.fromJson(Map<String, dynamic> json) => PersonalDetailData(
    id: json["id"],
    name: json["name"],
    value: Value.fromJson(json["value"]),
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

class Value {
  Value({
    this.optinEnabled,
    this.optinTextEn,
    this.optinTextNl,
    this.titleTextEn,
    this.titleTextNl,
    this.genderEnabled,
    this.genderTextEn,
    this.genderTextNl,
    this.addressEnabled,
    this.countryEnabled,
    this.countryTextEn,
    this.countryTextNl,
    this.birthdayTextEn,
    this.birthdayTextNl,
    this.languageEnabled,
    this.languageTextEn,
    this.languageTextNl,
    this.lastNameTextEn,
    this.lastNameTextNl,
    this.firstNameTextEn,
    this.firstNameTextNl,
    this.optinDescTextEn,
    this.optinDescTextNl,
    this.middleNameEnabled,
    this.middleNameTextEn,
    this.middleNameTextNl,
    this.saveButtonTextEn,
    this.saveButtonTextNl,
    this.addressCityEnabled,
    this.addressCityTextEn,
    this.addressCityTextNl,
    this.addressTypeEnabled,
    this.addressTypeTextEn,
    this.addressTypeTextNl,
    this.phoneNumberEnabled,
    this.phoneNumberTextEn,
    this.phoneNumberTextNl,
    this.addressStateEnabled,
    this.addressStateTextEn,
    this.addressStateTextNl,
    this.addressTitleTextEn,
    this.addressTitleTextNl,
    this.emailAddressTextEn,
    this.emailAddressTextNl,
    this.addressLine1Enabled,
    this.addressLine1TextEn,
    this.addressLine1TextNl,
    this.addressCountryEnabled,
    this.addressCountryTextEn,
    this.addressCountryTextNl,
    this.deleteCustomerTextEn,
    this.deleteCustomerTextNl,
    this.contactInfoTitleTextEn,
    this.contactInfoTitleTextNl,
    this.addressPostalCodeEnabled,
    this.addressPostalCodeTextEn,
    this.addressPostalCodeTextNl,
    this.personalInfoTitleTextEn,
    this.personalInfoTitleTextNl,
    this.addressHouseNumberEnabled,
    this.addressHouseNumberTextEn,
    this.addressHouseNumberTextNl,
    this.profilePicturePlaceholderUrlEn,
    this.profilePicturePlaceholderUrlNl,
    this.addressHouseNumberSuffixEnabled,
    this.addressHouseNumberSuffixTextEn,
    this.addressHouseNumberSuffixTextNl,
  });

  bool? optinEnabled;
  String? optinTextEn;
  String? optinTextNl;
  String? titleTextEn;
  String? titleTextNl;
  bool? genderEnabled;
  String? genderTextEn;
  String? genderTextNl;
  bool? addressEnabled;
  bool? countryEnabled;
  String? countryTextEn;
  String? countryTextNl;
  String? birthdayTextEn;
  String? birthdayTextNl;
  bool? languageEnabled;
  String? languageTextEn;
  String? languageTextNl;
  String? lastNameTextEn;
  String? lastNameTextNl;
  String? firstNameTextEn;
  String? firstNameTextNl;
  String? optinDescTextEn;
  String? optinDescTextNl;
  bool? middleNameEnabled;
  String? middleNameTextEn;
  String? middleNameTextNl;
  String? saveButtonTextEn;
  String? saveButtonTextNl;
  bool? addressCityEnabled;
  String? addressCityTextEn;
  String? addressCityTextNl;
  bool? addressTypeEnabled;
  String? addressTypeTextEn;
  String? addressTypeTextNl;
  bool? phoneNumberEnabled;
  String? phoneNumberTextEn;
  String? phoneNumberTextNl;
  bool? addressStateEnabled;
  String? addressStateTextEn;
  String? addressStateTextNl;
  String? addressTitleTextEn;
  String? addressTitleTextNl;
  String? emailAddressTextEn;
  String? emailAddressTextNl;
  bool? addressLine1Enabled;
  String? addressLine1TextEn;
  String? addressLine1TextNl;
  bool? addressCountryEnabled;
  String? addressCountryTextEn;
  String? addressCountryTextNl;
  String? deleteCustomerTextEn;
  String? deleteCustomerTextNl;
  String? contactInfoTitleTextEn;
  String? contactInfoTitleTextNl;
  bool? addressPostalCodeEnabled;
  String? addressPostalCodeTextEn;
  String? addressPostalCodeTextNl;
  String? personalInfoTitleTextEn;
  String? personalInfoTitleTextNl;
  bool? addressHouseNumberEnabled;
  String? addressHouseNumberTextEn;
  String? addressHouseNumberTextNl;
  String? profilePicturePlaceholderUrlEn;
  String? profilePicturePlaceholderUrlNl;
  bool? addressHouseNumberSuffixEnabled;
  String? addressHouseNumberSuffixTextEn;
  String? addressHouseNumberSuffixTextNl;

  factory Value.fromJson(Map<String, dynamic> json) => Value(
    optinEnabled: json["optin_enabled"],
    optinTextEn: json["optin_text_en"],
    optinTextNl: json["optin_text_nl"],
    titleTextEn: json["title_text_en"],
    titleTextNl: json["title_text_nl"],
    genderEnabled: json["gender_enabled"],
    genderTextEn: json["gender_text_en"],
    genderTextNl: json["gender_text_nl"],
    addressEnabled: json["address_enabled"],
    countryEnabled: json["country_enabled"],
    countryTextEn: json["country_text_en"],
    countryTextNl: json["country_text_nl"],
    birthdayTextEn: json["birthday_text_en"],
    birthdayTextNl: json["birthday_text_nl"],
    languageEnabled: json["language_enabled"],
    languageTextEn: json["language_text_en"],
    languageTextNl: json["language_text_nl"],
    lastNameTextEn: json["last_name_text_en"],
    lastNameTextNl: json["last_name_text_nl"],
    firstNameTextEn: json["first_name_text_en"],
    firstNameTextNl: json["first_name_text_nl"],
    optinDescTextEn: json["optin_desc_text_en"],
    optinDescTextNl: json["optin_desc_text_nl"],
    middleNameEnabled: json["middle_name_enabled"],
    middleNameTextEn: json["middle_name_text_en"],
    middleNameTextNl: json["middle_name_text_nl"],
    saveButtonTextEn: json["save_button_text_en"],
    saveButtonTextNl: json["save_button_text_nl"],
    addressCityEnabled: json["address_city_enabled"],
    addressCityTextEn: json["address_city_text_en"],
    addressCityTextNl: json["address_city_text_nl"],
    addressTypeEnabled: json["address_type_enabled"],
    addressTypeTextEn: json["address_type_text_en"],
    addressTypeTextNl: json["address_type_text_nl"],
    phoneNumberEnabled: json["phone_number_enabled"],
    phoneNumberTextEn: json["phone_number_text_en"],
    phoneNumberTextNl: json["phone_number_text_nl"],
    addressStateEnabled: json["address_state_enabled"],
    addressStateTextEn: json["address_state_text_en"],
    addressStateTextNl: json["address_state_text_nl"],
    addressTitleTextEn: json["address_title_text_en"],
    addressTitleTextNl: json["address_title_text_nl"],
    emailAddressTextEn: json["email_address_text_en"],
    emailAddressTextNl: json["email_address_text_nl"],
    addressLine1Enabled: json["address_line_1_enabled"],
    addressLine1TextEn: json["address_line_1_text_en"],
    addressLine1TextNl: json["address_line_1_text_nl"],
    addressCountryEnabled: json["address_country_enabled"],
    addressCountryTextEn: json["address_country_text_en"],
    addressCountryTextNl: json["address_country_text_nl"],
    deleteCustomerTextEn: json["delete_customer_text_en"],
    deleteCustomerTextNl: json["delete_customer_text_nl"],
    contactInfoTitleTextEn: json["contact_info_title_text_en"],
    contactInfoTitleTextNl: json["contact_info_title_text_nl"],
    addressPostalCodeEnabled: json["address_postal_code_enabled"],
    addressPostalCodeTextEn: json["address_postal_code_text_en"],
    addressPostalCodeTextNl: json["address_postal_code_text_nl"],
    personalInfoTitleTextEn: json["personal_info_title_text_en"],
    personalInfoTitleTextNl: json["personal_info_title_text_nl"],
    addressHouseNumberEnabled: json["address_house_number_enabled"],
    addressHouseNumberTextEn: json["address_house_number_text_en"],
    addressHouseNumberTextNl: json["address_house_number_text_nl"],
    profilePicturePlaceholderUrlEn: json["profile_picture_placeholder_url_en"],
    profilePicturePlaceholderUrlNl: json["profile_picture_placeholder_url_nl"],
    addressHouseNumberSuffixEnabled: json["address_house_number_suffix_enabled"],
    addressHouseNumberSuffixTextEn: json["address_house_number_suffix_text_en"],
    addressHouseNumberSuffixTextNl: json["address_house_number_suffix_text_nl"],
  );

  Map<String, dynamic> toJson() => {
    "optin_enabled": optinEnabled,
    "optin_text_en": optinTextEn,
    "optin_text_nl": optinTextNl,
    "title_text_en": titleTextEn,
    "title_text_nl": titleTextNl,
    "gender_enabled": genderEnabled,
    "gender_text_en": genderTextEn,
    "gender_text_nl": genderTextNl,
    "address_enabled": addressEnabled,
    "country_enabled": countryEnabled,
    "country_text_en": countryTextEn,
    "country_text_nl": countryTextNl,
    "birthday_text_en": birthdayTextEn,
    "birthday_text_nl": birthdayTextNl,
    "language_enabled": languageEnabled,
    "language_text_en": languageTextEn,
    "language_text_nl": languageTextNl,
    "last_name_text_en": lastNameTextEn,
    "last_name_text_nl": lastNameTextNl,
    "first_name_text_en": firstNameTextEn,
    "first_name_text_nl": firstNameTextNl,
    "optin_desc_text_en": optinDescTextEn,
    "optin_desc_text_nl": optinDescTextNl,
    "middle_name_enabled": middleNameEnabled,
    "middle_name_text_en": middleNameTextEn,
    "middle_name_text_nl": middleNameTextNl,
    "save_button_text_en": saveButtonTextEn,
    "save_button_text_nl": saveButtonTextNl,
    "address_city_enabled": addressCityEnabled,
    "address_city_text_en": addressCityTextEn,
    "address_city_text_nl": addressCityTextNl,
    "address_type_enabled": addressTypeEnabled,
    "address_type_text_en": addressTypeTextEn,
    "address_type_text_nl": addressTypeTextNl,
    "phone_number_enabled": phoneNumberEnabled,
    "phone_number_text_en": phoneNumberTextEn,
    "phone_number_text_nl": phoneNumberTextNl,
    "address_state_enabled": addressStateEnabled,
    "address_state_text_en": addressStateTextEn,
    "address_state_text_nl": addressStateTextNl,
    "address_title_text_en": addressTitleTextEn,
    "address_title_text_nl": addressTitleTextNl,
    "email_address_text_en": emailAddressTextEn,
    "email_address_text_nl": emailAddressTextNl,
    "address_line_1_enabled": addressLine1Enabled,
    "address_line_1_text_en": addressLine1TextEn,
    "address_line_1_text_nl": addressLine1TextNl,
    "address_country_enabled": addressCountryEnabled,
    "address_country_text_en": addressCountryTextEn,
    "address_country_text_nl": addressCountryTextNl,
    "delete_customer_text_en": deleteCustomerTextEn,
    "delete_customer_text_nl": deleteCustomerTextNl,
    "contact_info_title_text_en": contactInfoTitleTextEn,
    "contact_info_title_text_nl": contactInfoTitleTextNl,
    "address_postal_code_enabled": addressPostalCodeEnabled,
    "address_postal_code_text_en": addressPostalCodeTextEn,
    "address_postal_code_text_nl": addressPostalCodeTextNl,
    "personal_info_title_text_en": personalInfoTitleTextEn,
    "personal_info_title_text_nl": personalInfoTitleTextNl,
    "address_house_number_enabled": addressHouseNumberEnabled,
    "address_house_number_text_en": addressHouseNumberTextEn,
    "address_house_number_text_nl": addressHouseNumberTextNl,
    "profile_picture_placeholder_url_en": profilePicturePlaceholderUrlEn,
    "profile_picture_placeholder_url_nl": profilePicturePlaceholderUrlNl,
    "address_house_number_suffix_enabled": addressHouseNumberSuffixEnabled,
    "address_house_number_suffix_text_en": addressHouseNumberSuffixTextEn,
    "address_house_number_suffix_text_nl": addressHouseNumberSuffixTextNl,
  };
}
