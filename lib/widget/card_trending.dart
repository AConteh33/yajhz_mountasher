import 'package:flutter/material.dart';

import '../components/constants.dart';
import '../model/trending_seller.dart';


class Card_Trending extends StatelessWidget {

  Card_Trending({required this.trendingseller});

  Datlist trendingseller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Card(
          elevation: 100,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: SizedBox(
            height: 100,
            width: 100,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(trendingseller.image,scale: 20,),
                    ],
                  ),
                ],
              ),
            ),
          )
      ),
    );
  }
}
