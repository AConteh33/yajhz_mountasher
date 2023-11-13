// To parse this JSON data, do
//
//     final accountInfo = accountInfoFromJson(jsonString);

import 'dart:convert';

AccountInfo accountInfoFromJson(String str) => AccountInfo.fromJson(json.decode(str));

String accountInfoToJson(AccountInfo data) => json.encode(data.toJson());

class AccountInfo {
  bool success;
  int responseCode;
  String message;
  userData data;

  AccountInfo({
    required this.success,
    required this.responseCode,
    required this.message,
    required this.data,
  });

  factory AccountInfo.fromJson(Map<String, dynamic> json) => AccountInfo(
    success: json["success"],
    responseCode: json["response_code"],
    message: json["message"],
    data: userData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "response_code": responseCode,
    "message": message,
    "data": data.toJson(),
  };
}

class userData {
  int id;
  String name;
  String email;
  String phone;
  String image;
  int type;
  int status;
  String balance;
  List<dynamic> addresses;
  String token;

  userData({
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

  factory userData.fromJson(Map<String, dynamic> json) => userData(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    image: json["image"],
    type: json["type"],
    status: json["status"],
    balance: json["balance"],
    addresses: List<dynamic>.from(json["addresses"].map((x) => x)),
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
    "addresses": List<dynamic>.from(addresses.map((x) => x)),
    "token": token,
  };
}
