import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yajhz_mountasher/components/field.dart';
import 'package:yajhz_mountasher/controllers/auth_controller.dart';
import '../components/constants.dart';


class Top_Header extends StatelessWidget {

  TextEditingController searchctrl = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return SizedBox(
        width: MediaQuery.of(context).size.width,
        child: GetBuilder<AuthController>(
          init: AuthController(),
          builder: (acc) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  const SizedBox(height: 10,),

                  Row(
                    children: [
                      const SizedBox(width: 20,),
                      Text(acc.acount_info.data.name,style: txtmain.copyWith(
                          fontSize: 25,fontWeight: FontWeight.w400),),
                    ],
                  ),

                  const SizedBox(height: 5,),

                  Row(
                    children: [

                      const SizedBox(
                        width: 20,
                      ),

                      SizedBox(
                        width: 200,
                        child: Text(
                          acc.acount_info.data.addresses.length == 0 ? 'No address added' :acc.acount_info.data.addresses[0],
                          style: txtmain.copyWith(
                              fontSize: 15,
                              fontWeight: FontWeight.w300
                          ),
                        ),
                      ),

                      Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Theme.of(context).primaryColor,
                      ),

                    ],
                  ),

                  const SizedBox(height: 20,),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      sfield('Search for fav food ... ', searchctrl, obscure: false),
                      Card(
                        elevation: 0.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(13.0),
                        ),
                        color: Theme.of(context).primaryColor,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Icon(Icons.search,color: Colors.white,size: 30,),
                        ),
                      ),
                      SizedBox(
                          width: 40,
                          child: Image.asset('assets/filter.png')),
                    ],
                  )
                ],
              ),
            );
          }
        ),
      );
  }
}
