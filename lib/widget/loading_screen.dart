import 'package:flutter/material.dart';

class Loading_Screen extends StatefulWidget {
  const Loading_Screen({Key? key}) : super(key: key);

  @override
  State<Loading_Screen> createState() => _Loading_ScreenState();
}

class _Loading_ScreenState extends State<Loading_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(strokeWidth: 3.0,)
          ],
        ),
      ),
    );
  }
}
