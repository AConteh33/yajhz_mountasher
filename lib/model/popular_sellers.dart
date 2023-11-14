
import 'dart:convert';

PopularSeller popularSellerFromJson(String str) => PopularSeller.fromJson(json.decode(str));

String popularSellerToJson(PopularSeller data) => json.encode(data.toJson());

class PopularSeller {
  bool success;
  int responseCode;
  String message;
  List<Datum> data;

  PopularSeller({
    required this.success,
    required this.responseCode,
    required this.message,
    required this.data,
  });

  factory PopularSeller.fromJson(Map<String, dynamic> json) => PopularSeller(
    success: json["success"],
    responseCode: json["response_code"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "response_code": responseCode,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  int id;
  String name;
  String email;
  String phone;
  String image;
  String logo;
  String description;
  String distance;
  int type;
  int status;
  String lat;
  String lng;
  String address;
  String appointments;
  int trending;
  int popular;
  String rate;
  bool isFavorite;
  List<Category> categories;
  String token;
  Information information;
  List<ProductCategory> productCategories;

  Datum({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.image,
    required this.logo,
    required this.description,
    required this.distance,
    required this.type,
    required this.status,
    required this.lat,
    required this.lng,
    required this.address,
    required this.appointments,
    required this.trending,
    required this.popular,
    required this.rate,
    required this.isFavorite,
    required this.categories,
    required this.token,
    required this.information,
    required this.productCategories,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    image: json["image"],
    logo: json["logo"],
    description: json["description"]?? "",
    distance: json["distance"],
    type: json["type"],
    status: json["status"],
    lat: json["lat"]?? '',
    lng: json["lng"]?? '',
    address: json["address"]?? '',
    appointments: json["appointments"]?? '',
    trending: json["trending"]?? '',
    popular: json["popular"]?? '',
    rate: json["rate"]?? '',
    isFavorite: json["is_favorite"]?? '',
    categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
    token: json["token"]?? '',
    information: Information.fromJson(json["information"]),
    productCategories: List<ProductCategory>.from(json["product_categories"].map((x) => ProductCategory.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "phone": phone,
    "image": image,
    "logo": logo,
    "description": description,
    "distance": distance,
    "type": type,
    "status": status,
    "lat": lat,
    "lng": lng,
    "address": address,
    "appointments": appointments,
    "trending": trending,
    "popular": popular,
    "rate": rate,
    "is_favorite": isFavorite,
    "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
    "token": token,
    "information": information.toJson(),
    "product_categories": List<dynamic>.from(productCategories.map((x) => x.toJson())),
  };
}

class Category {
  int id;
  String name;
  String image;
  int active;

  Category({
    required this.id,
    required this.name,
    required this.image,
    required this.active,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    name: json["name"],
    image: json["image"],
    active: json["active"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
    "active": active,
  };
}

class Information {
  int id;
  String identityNumber;
  String taxRecord;
  dynamic activity;
  String nationality;
  String vehicleImage;
  String vehicleTabletImage;
  String vehicleRegistration;
  String drivingImage;

  Information({
    required this.id,
    required this.identityNumber,
    required this.taxRecord,
    required this.activity,
    required this.nationality,
    required this.vehicleImage,
    required this.vehicleTabletImage,
    required this.vehicleRegistration,
    required this.drivingImage,
  });

  factory Information.fromJson(Map<String, dynamic> json) => Information(
    id: json["id"],
    identityNumber: json["identity_number"],
    taxRecord: json["tax_record"],
    activity: json["activity"],
    nationality: json["nationality"],
    vehicleImage: json["vehicle_image"],
    vehicleTabletImage: json["vehicle_tablet_image"],
    vehicleRegistration: json["vehicle_registration"],
    drivingImage: json["driving_image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "identity_number": identityNumber,
    "tax_record": taxRecord,
    "activity": activity,
    "nationality": nationality,
    "vehicle_image": vehicleImage,
    "vehicle_tablet_image": vehicleTabletImage,
    "vehicle_registration": vehicleRegistration,
    "driving_image": drivingImage,
  };
}

class ProductCategory {
  int id;
  String name;
  int active;
  String nameAr;
  String nameEn;

  ProductCategory({
    required this.id,
    required this.name,
    required this.active,
    required this.nameAr,
    required this.nameEn,
  });

  factory ProductCategory.fromJson(Map<String, dynamic> json) => ProductCategory(
    id: json["id"],
    name: json["name"],
    active: json["active"],
    nameAr: json["name_ar"],
    nameEn: json["name_en"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "active": active,
    "name_ar": nameAr,
    "name_en": nameEn,
  };
}
