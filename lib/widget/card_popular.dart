import 'package:flutter/material.dart';
import 'package:yajhz_mountasher/components/constants.dart';
import 'package:yajhz_mountasher/model/popular_sellers.dart';

import '../model/trending_seller.dart';

class Card_Popular extends StatelessWidget {
  Card_Popular({required this.popularseller});

  PopularSeller popularseller;

  Widget rated({star}){
    return Icon(star ? Icons.star : Icons.star_border ,size: 10,color: Colors.white);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0),
      child: Card(
        elevation: 30.0,
        color: Colors.brown,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
        child: SizedBox(
          width: 150,
          height: 130,
          child: Stack(
            children: [

              ClipRRect(
                borderRadius: BorderRadius.circular(20), // Image border
                child: SizedBox.fromSize(
                  size: const Size.fromRadius(100), // Image radius
                  child: Image.network('https://www.seriouseats.com/thmb/d2DYiLy-rNKmxrW1gchCOZcGIWY=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/20210607-'
                      'INNOUTBURGERS-JANJIGIAN-seriouseats-23-b2b8a505ff414272aab71590a8985b85.jpg', fit: BoxFit.cover),
                ),
              ),



              Positioned(
                  top: 8,
                  left: 8,
                  child: Icon(
                    Icons.favorite,
                    color: Theme.of(context).primaryColor,
                    size: 20,
                  )
              ),

              Positioned(
                bottom: 0.0,
                right:0,
                left: 0,
                child: Container(
                  height: 60,
                  decoration: decore_bottom_curved.copyWith(
                    color: Colors.black.withOpacity(0.3),
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(20),bottomLeft: Radius.circular(20)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text(popularseller.name,style: txtsub.copyWith(color: Colors.white),),

                        Row(
                          children: [
                            Icon(Icons.add_location_sharp,size: 10,color: Colors.white),
                            Text('15 Km',style: txtsub.copyWith(color: Colors.white),),
                          ],
                        ),

                        Row(
                          children: [
                            rated(star: true),
                            rated(star: true),
                            rated(star: true),
                            rated(star: true),
                            rated(star: false),
                            SizedBox(width: 3,),
                            Text('4.3',style: txtsub.copyWith(color: Colors.white)),
                          ],
                        ),

                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
