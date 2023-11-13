import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:yajhz_mountasher/screen/account_info.dart';
import '../components/popup.dart';
import '../model/create_account_model.dart';
import '../model/login_model.dart';
import '../screen/home.dart';

class AuthController extends GetxController {

  final storage = const FlutterSecureStorage();

  AccountInfo acount_info = AccountInfo(success: false, responseCode: 401, message: '',
      data: userData(
          id: 0,
          name: "Loading",
          email: "Loading",
          phone: "Loading",
          image: "image",
          type: 1,
          status: 1,
          balance: "balance",
          addresses: [],
          token: "token"
      )
  );

  Userdata newdata = Userdata(
      success: false,
      responseCode: 0,
      message: '',
      data: Data(
          name: '',
          email: '',
          phone: '',
        image: '',
        id: 0,
        type: 0,
        status: 0,
        addresses: [],
        token: '',
        balance: '',
      )
  );

  CreateAccountModel AccountM = CreateAccountModel(
      success: false,
      responseCode: 200,
      message: 'Hey',
      data: nData(
          id: 20,
          name:  "",
          email: "",
          phone: "",
          image: "",
          type:  0,
          status: 0,
          balance: "",
          addresses: [],
          token: "",
      )
  );

  RxString name = ''.obs;
  RxString password = ''.obs;
  RxString devicetoken = ''.obs;
  RxBool isloggedin = false.obs;
  RxBool loading = false.obs;


  @override
  void onInit() {
    checkifloggedin();
    getprofile('');
    super.onInit();
  }

  signout() async {
    await deleteauth();
    print('1');
    acount_info = AccountInfo(success: false, responseCode: 401, message: '',
        data: userData(
            id: 0,
            name: "Loading",
            email: "Loading",
            phone: "Loading",
            image: "image",
            type: 1,
            status: 1,
            balance: "balance",
            addresses: [],
            token: "token"
        )
    );print('2');
    isloggedin = false.obs;print('3');
    checkifloggedin();print('4');
    update();print('5');
  }

  Saveauth(token) async {

    // Store token
    print('Saved current Token : ${token!}');
    await storage.write(key: 'authToken', value: token);
  }

  deleteauth() async {
    // Store token
    await storage.delete(key: 'authToken');

  }

  Future<String> gettoken() async {
    String? authToken = await storage.read(key: 'authToken');
    authToken == null ? print('No Token') : print('Get current Token : ${authToken!}');
    return authToken ?? '';
  }

  getprofile(String token) async {

    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${await gettoken()}',
      'lang': 'en'
    };

    var request = http.Request('GET', Uri.parse('https://yogahez.mountasher.online/api/client-profile'));

    request.headers.addAll(
        headers
    );

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {

      var responseBody = await response.stream.bytesToString();

      acount_info = accountInfoFromJson(responseBody);

    }else{

      var responseBody = await response.stream.bytesToString();

    }

    update();

  }

  checkifloggedin() async {
    if(await gettoken() == ''){
      // print('No user');
      isloggedin = false.obs;
    }else{
      // print('user exists');
      isloggedin = true.obs;
    }

    loading = false.obs;
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

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {

      var responseBody = await response.stream.bytesToString();

      newdata = userdataFromJson(responseBody);

      if(newdata.success){
        await Saveauth(newdata.data.token);
        getprofile(newdata.data.token);
        checkifloggedin();
      }else{
        showforerror(context,newdata.message, 'Something went wrong');
      }

    } else {

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

    var responseBody = await response.stream.bytesToString();

    var jsonData = json.decode(responseBody);

    AccountM = createAccountModelFromJson(responseBody);

    if(AccountM.success){

      Saveauth(AccountM.data.token);
      getprofile(AccountM.data.token);

      checkifloggedin();
      Navigator.of(context).pop();

    }else{
      showforerror(context,AccountM.message, 'Something went wrong');
    }

  }else if(response.statusCode == 404){
    print('not found');
  } else if(response.statusCode == 500){
    print('server not responding');
  } else {

  }

  }

}