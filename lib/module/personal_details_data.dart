import 'dart:convert';

List<PersonalDetailData> personalDetailDataFromJson(String str) =>
    List<PersonalDetailData>.from(
        json.decode(str).map((x) => PersonalDetailData.fromJson(x)));

String personalDetailDataToJson(List<PersonalDetailData> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PersonalDetailData {
  int id;
  String name;
  List<Value> value;
  AtedBy createdBy;
  AtedBy updatedBy;
  String createdAt;
  String updatedAt;

  PersonalDetailData({required this.id,
    required this.name,
    required this.value,
    required this.createdBy,
    required this.updatedBy,
    required this.createdAt,
    required this.updatedAt});

  factory PersonalDetailData.fromJson(Map<String, dynamic> json) =>
      PersonalDetailData(
        id: json["id"],
        name: json["name"],
        value: List<Value>.from(json["value"].map((x) => Value.fromJson(x))),
        createdBy: AtedBy.fromJson(json["created_by"]),
        updatedBy: AtedBy.fromJson(json["updated_by"]),
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() =>
      {
        "id": id,
        "name": name,
        "value": List<dynamic>.from(value.map((x) => x.toJson())),
        "created_by": createdBy.toJson(),
        "updated_by": updatedBy.toJson(),
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}

class AtedBy {
  AtedBy({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.username,
  });

  int id;
  String firstname;
  String lastname;
  dynamic username;

  factory AtedBy.fromJson(Map<String, dynamic> json) =>
      AtedBy(
        id: json["id"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        username: json["username"],
      );

  Map<String, dynamic> toJson() =>
      {
        "id": id,
        "firstname": firstname,
        "lastname": lastname,
        "username": username,
      };
}

class Value {
  String optinText;
  String titleText;
  String genderText;
  String countryText;
  String birthdayText;
  String languageCode;
  String languageText;
  bool optinEnabled;
  bool genderEnabled;
  String lastNameText;
  bool addressEnabled;
  bool countryEnabled;
  String firstNameText;
  String optinDescText;
  bool languageEnabled;
  String middleNameText;
  String saveButtonText;
  String addressCityText;
  String addressTypeText;
  String phoneNumberText;
  String addressStateText;
  String addressTitleText;
  String emailAddressText;
  String addressLine1Text;
  bool middleNameEnabled;
  bool addressCityEnabled;
  String addressCountryText;
  bool addressTypeEnabled;
  String deleteCustomerText;
  bool phoneNumberEnabled;
  bool addressStateEnabled;
  bool addressLine1Enabled;
  bool addressCountryEnabled;
  String contactInfoTitleText;
  String addressPostalCodeText;
  String personalInfoTitleText;
  String addressHouseNumberText;
  bool addressPostalCodeEnabled;
  bool addressHouseNumberEnabled;
  String profilePicturePlaceholderUrl;
  String addressHouseNumberSuffixText;
  bool addressHouseNumberSuffixEnabled;

  Value({required this.addressCityEnabled,
    required this.addressCityText,
    required this.addressCountryEnabled,
    required this.addressCountryText,
    required this.addressEnabled,
    required this.addressHouseNumberEnabled,
    required this.addressHouseNumberSuffixEnabled,
    required this.addressHouseNumberSuffixText,
    required this.addressHouseNumberText,
    required this.addressLine1Enabled,
    required this.addressLine1Text,
    required this.addressPostalCodeEnabled,
    required this.addressPostalCodeText,
    required this.addressStateEnabled,
    required this.addressStateText,
    required this.addressTitleText,
    required this.addressTypeEnabled,
    required this.addressTypeText,
    required this.birthdayText,
    required this.contactInfoTitleText,
    required this.countryEnabled,
    required this.countryText,
    required this.deleteCustomerText,
    required this.emailAddressText,
    required this.firstNameText,
    required this.genderEnabled,
    required this.genderText,
    required this.languageCode,
    required this.languageEnabled,
    required this.languageText,
    required this.lastNameText,
    required this.middleNameEnabled,
    required this.middleNameText,
    required this.optinDescText,
    required this.optinEnabled,
    required this.optinText,
    required this.personalInfoTitleText,
    required this.phoneNumberEnabled,
    required this.phoneNumberText,
    required this.profilePicturePlaceholderUrl,
    required this.saveButtonText,
    required this.titleText});

  factory Value.fromJson(Map<String, dynamic> json) =>
      Value(
          addressCityEnabled: json['address_city_enabled'],
          addressCityText: json['address_city_text'],
          addressCountryEnabled: json['address_country_enabled'],
          addressCountryText: json['address_country_text'],
          addressEnabled: json['address_enabled'],
          addressHouseNumberEnabled: json['address_house_number_enabled'],
          addressHouseNumberSuffixEnabled:
          json['address_house_number_suffix_enabled'],
          addressHouseNumberSuffixText: json['address_house_number_suffix_text'],
          addressHouseNumberText: json['address_house_number_text'],
          addressLine1Enabled: json['address_line_1_enabled'],
          addressLine1Text: json['address_line_1_text'],
          addressPostalCodeEnabled: json['address_postal_code_enabled'],
          addressPostalCodeText: json['address_postal_code_text'],
          addressStateEnabled: json['address_state_enabled'],
          addressStateText: json['address_state_text'],
          addressTitleText: json['address_title_text'],
          addressTypeEnabled: json['address_type_enabled'],
          addressTypeText: json['address_type_text'],
          birthdayText: json['birthday_text'],
          contactInfoTitleText: json['contact_info_title_text'],
          countryEnabled: json['country_enabled'],
          countryText: json['country_text'],
          deleteCustomerText: json['delete_customer_text'],
          emailAddressText: json['email_address_text'],
          firstNameText: json['first_name_text'],
          genderEnabled: json['gender_enabled'],
          genderText: json['gender_text'],
          languageCode: json['language_code'],
          languageEnabled: json['language_enabled'],
          languageText: json['language_text'],
          lastNameText: json['last_name_text'],
          middleNameEnabled: json['middle_name_enabled'],
          middleNameText: json['middle_name_text'],
          optinDescText: json['optin_desc_text'],
          optinEnabled: json['optin_enabled'],
          optinText: json['optin_text'],
          personalInfoTitleText: json['personal_info_title_text'],
          phoneNumberEnabled: json['phone_number_enabled'],
          phoneNumberText: json['phone_number_text'],
          profilePicturePlaceholderUrl: json['profile_picture_placeholder_url'],
          saveButtonText: json['save_button_text'],
          titleText: json['title_text']);

  Map<String, dynamic> toJson() =>
      {
        'address_city_enabled': addressCityEnabled,
        'address_city_text': addressCityText,
        'address_country_enabled': addressCountryEnabled,
        'address_country_text': addressCountryText,
        'address_enabled': addressEnabled,
        'address_house_number_enabled': addressHouseNumberEnabled,
        'address_house_number_suffix_enabled': addressHouseNumberSuffixEnabled,
        'address_house_number_suffix_text': addressHouseNumberSuffixText,
        'address_house_number_text': addressHouseNumberText,
        'address_line_1_enabled': addressLine1Enabled,
        'address_line_1_text': addressLine1Text,
        'address_postal_code_enabled': addressPostalCodeEnabled,
        'address_postal_code_text': addressPostalCodeText,
        'address_state_enabled': addressStateEnabled,
        'address_state_text': addressStateText,
        'address_title_text': addressTitleText,
        'address_type_enabled': addressTypeEnabled,
        'address_type_text': addressTypeText,
        'birthday_text': birthdayText,
        'contact_info_title_text': contactInfoTitleText,
        'country_enabled': countryEnabled,
        'country_text': countryText,
        'delete_customer_text': deleteCustomerText,
        'email_address_text': emailAddressText,
        'first_name_text': firstNameText,
        'gender_enabled': genderEnabled,
        'gender_text': genderText,
        'language_code': languageCode,
        'language_enabled': languageEnabled,
        'language_text': languageText,
        'last_name_text': lastNameText,
        'middle_name_enabled': middleNameEnabled,
        'middle_name_text': middleNameText,
        'optin_desc_text': optinDescText,
        'optin_enabled': optinEnabled,
        'optin_text': optinText,
        'personal_info_title_text': personalInfoTitleText,
        'phone_number_enabled': phoneNumberEnabled,
        'phone_number_text': phoneNumberText,
        'profile_picture_placeholder_url': profilePicturePlaceholderUrl,
        'save_button_text': saveButtonText,
        'title_text': titleText
      };
}
