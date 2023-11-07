import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;

import '../screen/home.dart';

class AuthController extends GetxController {

  RxString name = ''.obs;
  RxString password = ''.obs;
  RxString devicetoken = ''.obs;

  start_login(email,password) async {

    var headers = {
      'Accept': 'application/json',
      'lang': 'ar'
    };

    var request = http.MultipartRequest('POST', Uri.parse('http://yogahez.fatoorah.sa/api/login'));

    request.fields.addAll({
      'email': email,
      'password': password,
      'device_token': '12233454566787877'
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {

      print( await response.stream.bytesToString() );

      print('Successfully Completed.');

        Get.to(
          const Home(),
          transition: Transition.leftToRight
        );

    } else {
      print('Response : '+response.reasonPhrase.toString());
      print('Response : '+response.statusCode.toString());
    }

  }

  start_register(name,email,password,phone) async {

  var headers = {
    'lang': 'ar'
  };

  var request = http.MultipartRequest('POST', Uri.parse('http://yogahez.fatoorah.sa/api/client-register'));

  request.fields.addAll({
    'name': name,
    'email': email,
    'password': password,
    'phone': phone,
    'device_token': ''
  });

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    print(await response.stream.bytesToString());
  } else {
    print(response.reasonPhrase);
  }


  }

}