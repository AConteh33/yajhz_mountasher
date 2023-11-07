// To parse this JSON data, do
//
//     final trendingSeller = trendingSellerFromJson(jsonString);

import 'dart:convert';

List<TrendingSeller> trendingSellerFromJson(String str) => List<TrendingSeller>.from(json.decode(str).map((x) => TrendingSeller.fromJson(x)));

String trendingSellerToJson(List<TrendingSeller> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TrendingSeller {
  double lat;
  double lng;
  int filter;
  String name;

  TrendingSeller({
    required this.lat,
    required this.lng,
    required this.filter,
    required this.name,
  });

  factory TrendingSeller.fromJson(Map<String, dynamic> json) => TrendingSeller(
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
