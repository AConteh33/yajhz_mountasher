import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:popover/popover.dart';
import 'package:yajhz_mountasher/components/constants.dart';

import '../components/popup.dart';
import '../controllers/auth_controller.dart';


class Top_Bar extends StatefulWidget {
  Top_Bar({required this.ishome});
  bool ishome = false;

  @override
  State<Top_Bar> createState() => _Top_BarState();
}

class _Top_BarState extends State<Top_Bar> {

  AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {

    return Container(
      color: Colors.white,
      height: 60,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 10.0),
        child: Row(
          children: [

            GestureDetector(
                onTap: (){
                  if(widget.ishome){
                    showforsignout(context,'Are you sure',"Sign out",authController);
                  }else{
                    Navigator.of(context).pop();
                  }
                },
                child: Icon(
                  Icons.arrow_back_ios_new_outlined,
                  color: Theme.of(context).primaryColor,
                )
            ),

            Expanded(
                child: Center(
                  child: Text('Home',style: txtmain.copyWith(fontSize: 20,fontWeight: FontWeight.w400),),
                )
            ),

            SizedBox(
                width: 30,
                child: Image.asset('assets/cart.png',scale: 1.2,
                )
            ),

            GestureDetector(
              onTap: (){
                showPopover(
                  context: context,
                  bodyBuilder: (context) => ListItems(),
                  onPop: () => print('Popover was popped!'),
                  direction: PopoverDirection.bottom,
                  width: 200,
                  height: 200,
                  arrowHeight: 15,
                  arrowWidth: 30,
                );},
              child: SizedBox(
                  width: 30,
                  child: Image.asset('assets/menu.png',scale: 1.2,)
              ),
            ),

          ],
        ),
      ),
    );
  }
}


class ListItems extends StatelessWidget {

  AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: ListView(
          padding: const EdgeInsets.all(8),
          children: [
            InkWell(
              onTap: () {

              },
              child: Container(
                height: 40,
                color: Colors.amber,
                child: const Center(child: Text('Account Settings')),
              ),
            ),
            const Divider(),
            Container(
              height: 40,
              color: Colors.amber,
              child: const Center(child: Text('Order History')),
            ),
            const Divider(),
            GestureDetector(
              onTap: (){
                showforsignout(context,'Are you sure',"Sign out",authController);
              },
              child: Container(
                height: 40,
                color: Colors.amber,
                child: const Center(child: Text('Sign out')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
