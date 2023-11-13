import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yajhz_mountasher/controllers/login_controller.dart';
import 'package:yajhz_mountasher/screen/home.dart';
import 'package:yajhz_mountasher/screen/login.dart';
import 'package:yajhz_mountasher/widget/loading_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.

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
        init: AuthController(),
        builder: (auth) {

          // auth.checkifloggedin();
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
