// To parse this JSON data, do
//
//     final popularSeller = popularSellerFromJson(jsonString);

import 'dart:convert';

List<PopularSeller> popularSellerFromJson(String str) => List<PopularSeller>.from(json.decode(str).map((x) => PopularSeller.fromJson(x)));

String popularSellerToJson(List<PopularSeller> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PopularSeller {
  double lat;
  double lng;
  int filter;
  String name;

  PopularSeller({
    required this.lat,
    required this.lng,
    required this.filter,
    required this.name,
  });

  factory PopularSeller.fromJson(Map<String, dynamic> json) => PopularSeller(
    lat: json["lat"]?.toDouble(),
    lng: json["lng"]?.toDouble(),
    filter: json["filter"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "lat": lat,
    "lng": lng,
    "filter": filter,
    "name": name,
  };

}


