// To parse this JSON data, do
//
//     final allcategorymodel = allcategorymodelFromJson(jsonString);

import 'dart:convert';

Allcategorymodel allcategorymodelFromJson(String str) =>
    Allcategorymodel.fromJson(json.decode(str));

String allcategorymodelToJson(Allcategorymodel data) =>
    json.encode(data.toJson());

class Allcategorymodel {
  final List<Datum> data;
  final String message;

  Allcategorymodel({
    required this.data,
    required this.message,
  });

  factory Allcategorymodel.fromJson(Map<String, dynamic> json) =>
      Allcategorymodel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
      };
}

class Datum {
  final int id;
  final String name;

  Datum({
    required this.id,
    required this.name,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
