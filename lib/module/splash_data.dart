class Splashdata {
  Splashdata({
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
  Value value;
  AtedBy createdBy;
  AtedBy updatedBy;
  DateTime createdAt;
  DateTime updatedAt;

  factory Splashdata.fromJson(Map<String, dynamic> json) => Splashdata(
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
        "value": value.toJson(),
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
    required this.bgImageUrl,
    required this.logoImageUrl,
  });

  String bgImageUrl;
  String logoImageUrl;

  factory Value.fromJson(Map<String, dynamic> json) => Value(
        bgImageUrl: json["bg_image_url"],
        logoImageUrl: json["logo_image_url"],
      );

  Map<String, dynamic> toJson() => {
        "bg_image_url": bgImageUrl,
        "logo_image_url": logoImageUrl,
      };
}
