// To parse this JSON data, do
//
//     final news = newsFromJson(jsonString);

import 'dart:convert';

News newsFromJson(String str) => News.fromJson(json.decode(str));

String newsToJson(News data) => json.encode(data.toJson());

class News {
  Data data;
  String message;

  News({
    required this.data,
    required this.message,
  });

  factory News.fromJson(Map<String, dynamic> json) => News(
    data: Data.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
    "message": message,
  };
}

class Data {
  int id;
  String country;
  String title;
  String description;
  String photo;

  Data({
    required this.id,
    required this.country,
    required this.title,
    required this.description,
    required this.photo,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    country: json["country"],
    title: json["title"],
    description: json["description"],
    photo: json["photo"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "country": country,
    "title": title,
    "description": description,
    "photo": photo,
  };
}
