import 'package:flutter/material.dart';
import 'package:yajhz_mountasher/screen/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Color.fromRGBO(255, 210, 121, 1.0),
        backgroundColor: Colors.white,
        shadowColor: Colors.black12,
      ),
      home: const Login(),
    );
  }
}
