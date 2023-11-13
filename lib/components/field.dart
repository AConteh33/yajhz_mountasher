import 'package:flutter/material.dart';


Widget field(hint,textEditingController,
    {keyboard = TextInputType.text,
      bool big = false,
      enable = true,
      obscur,
      required bool obscure}) {
  return SizedBox(
      child: Column(children: [
        SizedBox(height: 10),
        Container(
            height: big ? null : 50,
            width: 300,
            decoration: BoxDecoration(
                border: Border.all(
                    width: 1, color: big ? Colors.grey : Colors.transparent),
                boxShadow: [
                  const BoxShadow(
                    color: Colors.black12,
                  ),
                  const BoxShadow(
                    color: Colors.white70,
                    spreadRadius: -2.0,
                    blurRadius: 2.0,
                    offset: Offset(2.0, 2.0),
                  ),
                ],
                borderRadius: BorderRadius.circular(15)
            ),
            child: Center(
                child: TextFormField(
                    enabled: enable,
                    keyboardAppearance: Brightness.dark,
                    autofocus: false,
                    cursorColor: Colors.black,
                    maxLines: big ? 3 : 1,
                    controller: textEditingController,
                    obscureText: obscure,
                    expands: false,
                    keyboardType: keyboard,
                    decoration: InputDecoration(
                      hintText: hint,
                      hintStyle: TextStyle(color: Colors.grey,fontSize: 10.0,),
                      contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 0.2),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 0.2),
                        borderRadius: BorderRadius.all(Radius.circular(18.0)),
                      ),
                    ))))
      ]));
}


Widget sfield(hint,textEditingController,
    {
      keyboard = TextInputType.text,
      bool big = false,
      enable = true,
      obscur,
      required bool obscure
    }) {
  return SizedBox(
      child: Center(
        child: Container(
            height: big ? null : 40,
            width: 240,
            decoration: BoxDecoration(
                border: Border.all(
                    width: 1, color: big ? Colors.grey : Colors.transparent),
                boxShadow: [
                  const BoxShadow(
                    color: Colors.black12,
                  ),
                  const BoxShadow(
                    color: Colors.white70,
                    spreadRadius: -1.5,
                    blurRadius: 3.0,
                    offset: Offset(2.0, 2.0),
                  ),
                ],
                borderRadius: BorderRadius.circular(15)
            ),
            child: Center(
                child: TextFormField(
                    enabled: enable,
                    keyboardAppearance: Brightness.dark,
                    autofocus: false,
                    cursorColor: Colors.white,
                    maxLines: big ? 3 : 1,
                    controller: textEditingController,
                    obscureText: obscure,
                    expands: false,
                    keyboardType: keyboard,
                    decoration: InputDecoration(
                      hintText: hint,
                      hintStyle: TextStyle(color: Colors.grey,fontSize: 10.0,),
                      contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 0.2),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 0.2),
                        borderRadius: BorderRadius.all(Radius.circular(18.0)),
                      ),
                    )))),
      ));
}