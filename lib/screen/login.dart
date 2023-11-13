import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:yajhz_mountasher/components/field.dart';
import 'package:yajhz_mountasher/screen/home.dart';
import 'package:yajhz_mountasher/screen/sign_up.dart';
import 'package:yajhz_mountasher/widget/button.dart';

import '../components/constants.dart';
import '../controllers/auth_controller.dart';
import '../widget/top_bar.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final AuthController loginController = Get.put(AuthController());

  TextEditingController emailctrl = TextEditingController();
  TextEditingController passctrl = TextEditingController();

  Widget fieldwidget({title,hint,controller,obscure,keyboard}){
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 40,),
            Text(title),
          ],
        ),
        field(hint, controller, obscure: obscure, keyboard:keyboard)
      ],
    );

  }

  String errormsg = '';
  String erroremailmsg = '';
  String errorpassmsg = '';


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

                SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height - 450,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset('assets/brand_logo.png',scale: 1.2,),
                      ],
                    )),

                Padding(
                  padding: const EdgeInsets.only(top:300.0),
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
                              child: Text('LOG IN',style: txtmain.copyWith(fontSize: 20,color: Colors.black54),),
                            ),
                          ),
                        ),

                        Expanded(
                            child: Column(
                              children: [

                                const SizedBox(
                                  height: 20,
                                ),

                                fieldwidget(
                                    title: 'Email',
                                    hint: 'Write your email',
                                    controller: emailctrl,
                                    obscure: false,
                                    keyboard:TextInputType.emailAddress
                                ),

                                const SizedBox(
                                  height: 5,
                                ),

                                erroremailmsg != '' ?

                                Text( erroremailmsg ,style: txtsub.copyWith( color: Colors.red , fontWeight: FontWeight.bold ), ) :

                                const SizedBox(),

                                const SizedBox(
                                  height: 15,
                                ),

                                fieldwidget(
                                  title: 'Password',
                                  hint: 'Write your Password',
                                  controller: passctrl,
                                  obscure: true,
                                  keyboard:TextInputType.visiblePassword,
                                ),

                                const SizedBox(
                                  height: 5,
                                ),

                                errorpassmsg != '' ? Text(errorpassmsg, style: txtsub.copyWith(color: Colors.red,fontWeight: FontWeight.bold),):SizedBox(),

                                const SizedBox(height: 10,),

                                Row(
                                  children: [
                                    const SizedBox(width: 40),
                                    Text('Forget the password ?',style: txtsub.copyWith(color: Colors.grey,fontWeight: FontWeight.bold),),
                                  ],
                                ),

                                const SizedBox(height: 20),

                                Buttoner(
                                    title: 'Log in',
                                    width: MediaQuery.of(context).size.width - 100,
                                    ontap: (){

                                      if (emailctrl.text.isEmpty){
                                        erroremailmsg = 'Please enter your Email';
                                      }else if(passctrl.text.isEmpty){
                                        errorpassmsg = 'Please enter your Password';
                                        passctrl.clear();
                                      }else{
                                        erroremailmsg = '';
                                        errorpassmsg = '';

                                        loginController.start_login(emailctrl.text,passctrl.text,context);

                                        // Navigator.push(
                                        //   context,
                                        //   MaterialPageRoute(
                                        //     builder: (context) =>
                                        //     const Home(),
                                        //   ),
                                        // );

                                      }

                                      setState(() {

                                      });



                                    }),

                                const SizedBox(height: 30,),

                                GestureDetector(
                                  onTap: (){
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                        const Sign_up(),
                                      ),
                                    );
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('don\'t have an account ?',style: txtsub.copyWith(color: Colors.grey,fontWeight: FontWeight.bold),),
                                      Text(' Sign up',style: txtsub.copyWith(color: Colors.teal,fontWeight: FontWeight.bold),),
                                    ],
                                  ),
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
