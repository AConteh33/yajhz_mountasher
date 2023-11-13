import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yajhz_mountasher/controllers/auth_controller.dart';
import 'package:yajhz_mountasher/screen/home.dart';
import 'package:yajhz_mountasher/screen/login.dart';
import 'package:yajhz_mountasher/widget/loading_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  AuthController authController = Get.put(AuthController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Yajhz',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: const Color.fromRGBO(255, 210, 121, 1.0),
        backgroundColor: Colors.white,
        shadowColor: Colors.black12,
      ),
      home: GetBuilder<AuthController>(
          global: true,
        init: AuthController(),
        builder: (auth) {

          if(auth.loading.value){
            return const Loading_Screen();
          }else{
            if(auth.isloggedin.value){
              return const Home();
            }else{
              return const Login();
            }
          }

        }
      ),
    );
  }
}
