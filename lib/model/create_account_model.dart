
import 'dart:convert';

CreateAccountModel createAccountModelFromJson(String str) => CreateAccountModel.fromJson(json.decode(str));

String createAccountModelToJson(CreateAccountModel data) => json.encode(data.toJson());

class CreateAccountModel {
  bool success;
  int responseCode;
  String message;
  nData data;

  CreateAccountModel({
    required this.success,
    required this.responseCode,
    required this.message,
    required this.data,
  });

  factory CreateAccountModel.fromJson(Map<String, dynamic> json) => CreateAccountModel(
    success: json["success"],
    responseCode: json["response_code"],
    message: json["message"],
    data: nData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "response_code": responseCode,
    "message": message,
    "data": data.toJson(),
  };

}

class nData {
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

  nData({
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

  factory nData.fromJson(Map<String, dynamic> json) => nData(
    id: json["id"] ?? 0,
    name: json["name"] ?? '',
    email: json["email"] ?? '',
    phone: json["phone"] ?? '',
    image: json["image"] ?? '',
    type: json["type"] ?? 0,
    status: json["status"] ?? 0,
    balance: json["balance"] ?? '',
    addresses: List<dynamic>.from(json["addresses"] == null ? []:json["addresses"].map((x) => x)),
    token: json["token"] ?? '',
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
