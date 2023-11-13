import 'package:flutter/material.dart';


void showforsignout(context,String message,String title,auth) {

  showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)
            )
        ),
        title: Text(title),
        content: Text(
          message,
          style: const TextStyle(
              fontSize: 15
          ),
        ),
        actions: <Widget>[

          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel')),

          TextButton(
              onPressed: () {

                auth.signout();

                Navigator.of(context).pop();

              },
              child: const Text('Sign out')
          ),
        ],
      ));
}

void showforerror(context,String message,String title) {

  showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        title: Text(title),
        content: Text(
          message,
          style: const TextStyle(
              fontSize: 15
          ),
        ),
        actions: <Widget>[
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Ok')),
        ],
      ));
}
