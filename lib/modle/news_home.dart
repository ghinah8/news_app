import 'dart:convert';

Newshome newshomeFromJson(String str) => Newshome.fromJson(json.decode(str));

String newshomeToJson(Newshome data) => json.encode(data.toJson());

class Newshome {
  List<Datum> data;
  String message;

  Newshome({
    required this.data,
    required this.message,
  });

  factory Newshome.fromJson(Map<String, dynamic> json) => Newshome(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "message": message,
  };
}

class Datum {
  int id;
  String country;
  String description;
  String photo;

  Datum({
    required this.id,
    required this.country,
    required this.description,
    required this.photo,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    country: json["country"],
    description: json["description"],
    photo: json["photo"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "country": country,
    "description": description,
    "photo": photo,
  };
}
