// To parse this JSON data, do
//
//     final addcategorymodel = addcategorymodelFromJson(jsonString);

import 'dart:convert';

Addcategorymodel addcategorymodelFromJson(String str) =>
    Addcategorymodel.fromJson(json.decode(str));

String addcategorymodelToJson(Addcategorymodel data) =>
    json.encode(data.toJson());

class Addcategorymodel {
  final Data data;
  final String message;

  Addcategorymodel({
    required this.data,
    required this.message,
  });

  factory Addcategorymodel.fromJson(Map<String, dynamic> json) =>
      Addcategorymodel(
        data: Data.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
    "message": message,
  };
}

class Data {
  final int id;
  final String name;
  final String email;
  final dynamic emailVerifiedAt;
  final int countryId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<Category> categories;

  Data({
    required this.id,
    required this.name,
    required this.email,
    required this.emailVerifiedAt,
    required this.countryId,
    required this.createdAt,
    required this.updatedAt,
    required this.categories,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    emailVerifiedAt: json["email_verified_at"],
    countryId: json["country_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    categories: List<Category>.from(
        json["categories"].map((x) => Category.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "email_verified_at": emailVerifiedAt,
    "country_id": countryId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
  };
}

class Category {
  final int id;
  final String name;
  final dynamic createdAt;
  final dynamic updatedAt;

  Category({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    name: json["name"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}
