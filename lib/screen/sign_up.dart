import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../components/constants.dart';
import '../components/field.dart';
import '../controllers/login_controller.dart';
import '../widget/button.dart';


class Sign_up extends StatefulWidget {
  const Sign_up({Key? key}) : super(key: key);

  @override
  State<Sign_up> createState() => _Sign_upState();
}

class _Sign_upState extends State<Sign_up> {


  TextEditingController emailctrl = TextEditingController();
  TextEditingController passctrl = TextEditingController();
  TextEditingController confirmctrl = TextEditingController();
  TextEditingController namectrl = TextEditingController();
  TextEditingController phonectrl = TextEditingController();

  String errormsg = '';
  String erroremailmsg = '',errorpassmsg = '',errorconfmsg = '', errorname = '',errorphone = '';

  final AuthController authController = Get.put(AuthController());

  Widget fieldwidget({title,hint,controller,obscure}){
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 40,),
            Text(title),
          ],
        ),
        field(hint, controller, obscure: obscure)
      ],
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [

                // App bar here.
                Positioned(
                    top: 0,
                    right: 0,
                    left: 0,
                    bottom: 0,
                    child: Image.asset('assets/main_background.png',fit: BoxFit.fitWidth,)
                ),

                Positioned(
                  top:0,
                  child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset('assets/brand_logo.png',scale: 1.5,),
                        ],
                      )),
                ),

                Padding(
                  padding: const EdgeInsets.only(top:100.0),
                  child: Container(
                    decoration: decore_top_curved,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          decoration: decore_bottom_curved,
                          width: 130,
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text('SIGN UP',style: txtmain.copyWith(fontSize: 20,color: Colors.black54),),
                            ),
                          ),
                        ),

                        Expanded(
                            child: Column(
                              children: [

                                const SizedBox(height: 20,),

                                fieldwidget(
                                    title: 'Name',
                                    hint: 'Write 14 Characters',
                                    controller: emailctrl,
                                    obscure: false
                                ),

                                errorname != '' ?  Text(errorname , style: txtsub.copyWith(color: Colors.red,fontWeight: FontWeight.bold),):SizedBox(),

                                const SizedBox(height: 10,),

                                fieldwidget(
                                    title: 'Email',
                                    hint: 'Write your email',
                                    controller: emailctrl,
                                    obscure: false
                                ),

                                erroremailmsg != '' ?  Text(erroremailmsg , style: txtsub.copyWith(color: Colors.red,fontWeight: FontWeight.bold),):SizedBox(),

                                const SizedBox(height: 10,),

                                fieldwidget(
                                    title: 'Phone Number',
                                    hint: 'Write 11 numbers',
                                    controller: emailctrl,
                                    obscure: false
                                ),

                                errorphone != '' ?  Text(errorphone , style: txtsub.copyWith(color: Colors.red,fontWeight: FontWeight.bold),):SizedBox(),

                                const SizedBox(height: 10,),

                                fieldwidget(
                                    title: 'Password',
                                    hint: 'Write 8 characters at least',
                                    controller: passctrl,
                                    obscure: true
                                ),

                                errorpassmsg != '' ?  Text(errorpassmsg , style: txtsub.copyWith(color: Colors.red,fontWeight: FontWeight.bold),):SizedBox(),

                                const SizedBox(height: 10,),

                                fieldwidget(
                                  title: 'Confirm Password',
                                  hint: 'Write your Password again',
                                  controller: passctrl,
                                  obscure: false,
                                ),

                                errorconfmsg != '' ?  Text(errorconfmsg , style: txtsub.copyWith(color: Colors.red,fontWeight: FontWeight.bold),):SizedBox(),

                                const SizedBox(height: 15,),


                                Buttoner(
                                    title: 'Sign up',
                                    width: MediaQuery.of(context).size.width - 100,
                                    ontap: (){

                                      if(namectrl.text.isEmpty){
                                        errorname = 'Enter your name';
                                      }else if(emailctrl.text.isEmpty){
                                        erroremailmsg = 'Enter your name';
                                      }else if(passctrl.text.isEmpty){
                                        errorpassmsg = 'Enter your Password';
                                      }else if(confirmctrl.text != passctrl.text){
                                        errorconfmsg = 'Confirm your Password';
                                      }else if(phonectrl.text.isEmpty){
                                        errorphone = 'Enter your phone';
                                      }else{

                                        authController.start_register(
                                            namectrl.text,
                                            emailctrl.text,
                                            passctrl.text,
                                            phonectrl.text
                                        );

                                      }

                                      setState(() {

                                      });


                                    }),

                                const SizedBox(height: 20,),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('have an account ?',style: txtsub.copyWith(color: Colors.grey,fontWeight: FontWeight.bold),),
                                    Text(' Log in',style: txtsub.copyWith(color: Colors.brown,fontWeight: FontWeight.bold),),
                                  ],
                                ),

                              ],
                            )
                        ),



                      ],
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
