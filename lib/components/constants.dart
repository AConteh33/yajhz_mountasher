import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

const kinputTextDecoration = InputDecoration(
  hintText: 'Enter a value',
  hintStyle: TextStyle(color: Colors.grey),
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.green, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.green, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(18.0)),
  ),
);

const kinputTextDecorationanswer = InputDecoration(
  hintText: 'Enter a value',
  hintStyle: TextStyle(color: Colors.grey),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(2.5)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.green, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(0.1)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.green, width: 1.5),
    borderRadius: BorderRadius.all(Radius.circular(1.0)),
  ),
);

const decore = BoxDecoration(
  color: Colors.white,
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      spreadRadius: 1,
      blurRadius:  5,
      offset: Offset(0, 0), // changes position of shadow
    ),
  ],

);

const decore_top_curved = BoxDecoration(
  color: Colors.white,
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      spreadRadius: 1,
      blurRadius:  5,
      offset: Offset(0, 0), // changes position of shadow
    ),
  ],
  borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20)),
);

const decore_bottom_curved = BoxDecoration(
  color: Colors.white,
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      spreadRadius: 3,
      blurRadius:  10,
      offset: Offset(0, 0), // changes position of shadow
    ),
  ],
  borderRadius: BorderRadius.only(bottomRight: Radius.circular(30),bottomLeft: Radius.circular(30)),
);

const decore_noshadow = BoxDecoration(
  color: Colors.white,
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      spreadRadius: 1,
      blurRadius:  5,
      offset: Offset(0, 0), // changes position of shadow
    ),
  ],

);

const txtmain = TextStyle(fontSize: 15,fontWeight: FontWeight.w600);

const txtsub = TextStyle(fontSize: 10);