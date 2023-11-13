import 'package:flutter/material.dart';
import 'package:yajhz_mountasher/components/constants.dart';
import 'package:yajhz_mountasher/model/category.dart';

import '../model/popular_sellers.dart';

class Card_Category extends StatelessWidget {
  Card_Category({required this.category});

  CategoryData category;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Card(
        elevation: 15.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
        child: SizedBox(
          height: 100,
          width: 100,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Expanded(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.network(category.image),
                  ],
                )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      category.name,
                      style: txtsub,
                    ),
                  ],
                )
              ],
            ),
          ),
        )
      ),
    );
  }
}
