// To parse this JSON data, do
//
//     final userdata = userdataFromJson(jsonString);

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
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "response_code": responseCode,
    "message": message,
    "data": data.toJson(),
  };

}

class Data {
  String name;
  String email;
  String password;
  String phone;
  String deviceToken;

  Data({
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
    required this.deviceToken,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    name: json["name"] ?? '',
    email: json["email"] ?? '',
    password: json["password"] ?? '',
    phone: json["phone"] ?? '',
    deviceToken: json["device_token"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "password": password,
    "phone": phone,
    "device_token": deviceToken,
  };

}