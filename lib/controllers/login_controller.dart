import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../model/create_account_model.dart';
import '../model/login_model.dart';
import '../screen/home.dart';

class AuthController extends GetxController {
  final storage = FlutterSecureStorage();



  Userdata newdata = Userdata(success: false, responseCode: 0, message: '',
      data: Data(name: '', email: '', password: '', phone: '', deviceToken: '')
  );

  CreateAccountModel AccountM = CreateAccountModel(success: false, responseCode: 200, message: 'Hey',
      data: nData(id: 20, name: "", email: "", phone: "", image: "", type: 0, status: 0, balance: "", addresses: [], token: "")
  );

  RxString name = ''.obs;
  RxString password = ''.obs;
  RxString devicetoken = ''.obs;
  RxBool isloggedin = false.obs;
  RxBool loading = false.obs;


  @override
  void onInit() {
    checkifloggedin();
    super.onInit();
  }

  Saveauth(token) async {
    // Store token
    await storage.write(key: 'authToken', value: token);
  }

  deleteauth(token) async {
    // Store token
    await storage.delete(key: 'authToken');
  }

  gettoken() async {
    String? authToken = await storage.read(key: 'authToken');
    return authToken ?? '';
  }

  checkifloggedin() async {

    // We can check and see if user is logged in.
    if(gettoken() == ''){
      print('No user');
      isloggedin = false.obs;
      // return false;
    }else{
      print('user exists');
      isloggedin = true.obs;
      // return true;
    }
    update();
  }

  void start_login(email,password,context) async {

    var headers = {
      'Accept': 'application/json',
      'lang': 'en'
    };

    var request = http.MultipartRequest('POST', Uri.parse('https://yogahez.mountasher.online/api/login'));

    request.fields.addAll({
      'email': email,
      'password': password,
      'device_token': '12233454566787877'
    });

    // print('Email : '+ email +
    //     '\n' + 'Password : ' + password);

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {

      print('Successfully Completed.');

      var responseBody = await response.stream.bytesToString();

      // var jsonData = json.decode(responseBody);
      //
      // print(jsonData);
      // var d = json.decode(jsonData);
      // print(responseBody);

      // This is where the data will be stored

      print('Successfully ' + newdata.message);

      newdata = userdataFromJson(responseBody);

      // This is where the data will be stored
      // Saveauth(newdata.data.deviceToken);

      if(newdata.success){
        print('Successfully Completed.');
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
            const Home(),
          ),
        );
        Saveauth(newdata.data.deviceToken);
      }else{
        print('Un-Successfully ' + newdata.message);
        Get.snackbar('Error', newdata.message,);
      }

        // Get.to(
        //   const Home(),
        //   transition: Transition.leftToRight
        // );

    } else {

      print('Response : '+response.reasonPhrase.toString());

      // var responseBody = await response.stream.bytesToString();
      // print('Response t: '+json.decode(responseBody));

    }

  }

  void start_register({name,email,password,phone,context}) async {

  var headers = {
    'lang': 'en'
  };

  var request = http.MultipartRequest('POST', Uri.parse('https://yogahez.mountasher.online/api/client-register'));

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

    // success
    print('Success');

    var responseBody = await response.stream.bytesToString();
    var jsonData = json.decode(responseBody);
    print(jsonData);

    AccountM = createAccountModelFromJson(responseBody);

    if(AccountM.success){
      Saveauth(AccountM.data.token);
      print(AccountM.message);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
          const Home(),
        ),
      );
    }else{
      print("Error " + AccountM.message);
    }

  } else if(response.statusCode == 404){
    // not found
    print('not found');
  } else if(response.statusCode == 500){
    // server not responding.
    print('server not responding');
  } else {
    // some other error or might be CORS policy error. you can add your url in CORS policy.
  }

  // if (response.statusCode == 200) {
  //
  //   var responseBody = await response.stream.bytesToString();
  //   var jsonData = json.decode(responseBody);
  //
  //   userdataFromJson(jsonData);
  //
  //   print(jsonData);
  //
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) =>
  //       const Home(),
  //     ),
  //   );
  //   // print(await response.stream.bytesToString());
  //
  // } else {
  //   print(response.reasonPhrase);
  // }

  }

}