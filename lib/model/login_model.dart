
import 'dart:convert';

Userdata userdataFromJson(String str) => Userdata.fromJson(json.decode(str));

String userdataToJson(Userdata data) => json.encode(data.toJson());

class Userdata {
  bool success;
  int responseCode;
  String message;
  Data data;

  Userdata({
    required this.success,
    required this.responseCode,
    required this.message,
    required this.data,
  });

  factory Userdata.fromJson(Map<String, dynamic> json) => Userdata(
    success: json["success"],
    responseCode: json["response_code"],
    message: json["message"],
    data: Data.fromJson(json["data"]?? {
      "id": 2,
      "name": "anas",
      "email": "anas.akid7@gmail.com",
      "phone": "01096884718",
      "image": "https://yogahez.mountasher.online/public/default/default-shop.jpg",
      "type": 1,
      "status": 1,
      "balance": "0.00",
      "addresses": [
        {
          "id": 1,
          "lat": "29.1931",
          "lng": "30.6421",
          "address": null,
          "street": "14",
          "building": "5",
          "apartment": "1",
          "floor": null,
          "name": null
        }
      ],
      "token": "",
    }),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "response_code": responseCode,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  int id;
  String name;
  String email;
  String phone;
  String image;
  int type;
  int status;
  String balance;
  List<Address> addresses;
  String token;

  Data({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.image,
    required this.type,
    required this.status,
    required this.balance,
    required this.addresses,
    required this.token,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    image: json["image"],
    type: json["type"],
    status: json["status"],
    balance: json["balance"],
    addresses: List<Address>.from(json["addresses"].map((x) => Address.fromJson(x))),
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "phone": phone,
    "image": image,
    "type": type,
    "status": status,
    "balance": balance,
    "addresses": List<dynamic>.from(addresses.map((x) => x.toJson())),
    "token": token,
  };
}

class Address {
  int id;
  String lat;
  String lng;
  dynamic address;
  String street;
  String building;
  String apartment;
  dynamic floor;
  dynamic name;

  Address({
    required this.id,
    required this.lat,
    required this.lng,
    required this.address,
    required this.street,
    required this.building,
    required this.apartment,
    required this.floor,
    required this.name,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    id: json["id"],
    lat: json["lat"],
    lng: json["lng"],
    address: json["address"],
    street: json["street"],
    building: json["building"],
    apartment: json["apartment"],
    floor: json["floor"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "lat": lat,
    "lng": lng,
    "address": address,
    "street": street,
    "building": building,
    "apartment": apartment,
    "floor": floor,
    "name": name,
  };
}
