import 'package:flutter/material.dart';
import 'package:yajhz_mountasher/components/constants.dart';


class Top_Bar extends StatefulWidget {
  const Top_Bar({Key? key}) : super(key: key);

  @override
  State<Top_Bar> createState() => _Top_BarState();
}

class _Top_BarState extends State<Top_Bar> {

  @override
  Widget build(BuildContext context) {
    // #ffd279
    return Container(
      color: Colors.white,
      height: 60,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 10.0),
        child: Row(
          children: [

            GestureDetector(
                onTap: (){
                  Navigator.of(context).pop();
                },
                child: Icon(Icons.arrow_back_ios_new_outlined,color: Theme.of(context).primaryColor,)),

            Expanded(
                child: Center(
                  child: Text('Home',style: txtmain.copyWith(fontSize: 20,fontWeight: FontWeight.w400),),
                )
            ),

            SizedBox(
                width: 30,
                child: Image.asset('assets/cart.png',scale: 1.2,)),

            SizedBox(
                width: 30,
                child: Image.asset('assets/menu.png',scale: 1.2,)),

          ],
        ),
      ),
    );
  }
}
