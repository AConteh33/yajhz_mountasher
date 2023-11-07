import 'package:flutter/material.dart';

class Buttoner extends StatelessWidget {
  Buttoner({required this.title,required this.width,required this.ontap});
  String title;
  double width;
  VoidCallback? ontap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: 50,
        width: width,
        decoration: BoxDecoration(
          color: const Color.fromRGBO(0, 149, 123,1.0),
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(title,style: TextStyle(
              color: Colors.white,
            ),)
          ],
        ),
      ),
    );
  }
}
