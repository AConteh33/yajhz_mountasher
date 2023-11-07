// To parse this JSON data, do
//
//     final category = categoryFromJson(jsonString);

import 'dart:convert';

List<Category> categoryFromJson(String str) => List<Category>.from(json.decode(str).map((x) => Category.fromJson(x)));

String categoryToJson(List<Category> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Category {
  String image;

  Category({
    required this.image,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "image": image,
  };

}
