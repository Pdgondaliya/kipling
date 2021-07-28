// To parse this JSON data, do
//
//     final countryPickerModel = countryPickerModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<CountryPickerModel> countryPickerModelFromJson(String str) => List<CountryPickerModel>.from(json.decode(str).map((x) => CountryPickerModel.fromJson(x)));

String countryPickerModelToJson(List<CountryPickerModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CountryPickerModel {
  CountryPickerModel({
    required this.id,
    required this.name,
    required this.value,
    required this.createdBy,
    required this.updatedBy,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String name;
  List<Value> value;
  AtedBy createdBy;
  AtedBy updatedBy;
  DateTime createdAt;
  DateTime updatedAt;

  factory CountryPickerModel.fromJson(Map<String, dynamic> json) => CountryPickerModel(
    id: json["id"],
    name: json["name"],
    value: List<Value>.from(json["value"].map((x) => Value.fromJson(x))),
    createdBy: AtedBy.fromJson(json["created_by"]),
    updatedBy: AtedBy.fromJson(json["updated_by"]),
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "value": List<dynamic>.from(value.map((x) => x.toJson())),
    "created_by": createdBy.toJson(),
    "updated_by": updatedBy.toJson(),
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
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
    required this.code,
    required this.name,
    required this.numcode,
  });

  String code;
  String name;
  String numcode;

  factory Value.fromJson(Map<String, dynamic> json) => Value(
    code: json["code"],
    name: json["name"],
    numcode: json["numcode"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "name": name,
    "numcode": numcode,
  };
}
