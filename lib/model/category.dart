
import 'dart:convert';

MainCategory mainCategoryFromJson(String str) => MainCategory.fromJson(json.decode(str));

String mainCategoryToJson(MainCategory data) => json.encode(data.toJson());

class MainCategory {
  bool success;
  int responseCode;
  String message;
  List<CategoryData> data;
  int cartCount;

  MainCategory({
    required this.success,
    required this.responseCode,
    required this.message,
    required this.data,
    required this.cartCount,
  });

  factory MainCategory.fromJson(Map<String, dynamic> json) => MainCategory(
    success: json["success"],
    responseCode: json["response_code"],
    message: json["message"],
    data: List<CategoryData>.from(json["data"].map((x) => CategoryData.fromJson(x))),
    cartCount: json["cart_count"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "response_code": responseCode,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "cart_count": cartCount,
  };
}

class CategoryData {
  int id;
  String name;
  String image;
  int active;
  String nameAr;
  String nameEn;

  CategoryData({
    required this.id,
    required this.name,
    required this.image,
    required this.active,
    required this.nameAr,
    required this.nameEn,
  });

  factory CategoryData.fromJson(Map<String, dynamic> json) => CategoryData(
    id: json["id"],
    name: json["name"],
    image: json["image"],
    active: json["active"],
    nameAr: json["name_ar"],
    nameEn: json["name_en"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
    "active": active,
    "name_ar": nameAr,
    "name_en": nameEn,
  };
}
