import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:yajhz_mountasher/controllers/product_controller.dart';

import '../components/constants.dart';
import '../widget/card_category.dart';
import '../widget/card_popular.dart';
import '../widget/card_trending.dart';
import '../widget/top_bar.dart';
import '../widget/top_header.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Widget lists({title,list,required double height,child}){

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20.0,bottom: 20.0,top: 20.0,right: 10.0),
          child: Row(
            children: [
              Text(title),
              Spacer(),
              Text('View all',style: txtsub.copyWith(color: Theme.of(context).primaryColor,fontWeight: FontWeight.bold,decoration: TextDecoration.underline,fontSize: 10),),
            ],
          ),
        ),
        Container(
          height: height,
          width: MediaQuery.of(context).size.width,
          child: child,
        )
      ],
    );
  }

  final Product_Controller product_controller = Get.put(Product_Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: Column(
          children: [
            //Add Top app here.
            const Top_Bar(),

            Top_Header(),

            Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [

                      lists(
                        title: 'Categories',
                        height: 100,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: product_controller.Categorylist.value.length,
                          itemBuilder: (BuildContext context, int index) {

                            return Card_Category(
                              category: product_controller.Categorylist.value[index],
                            );

                          }
                        ),
                      ),

                      lists(
                        title: 'Popular now',
                        height: 140,
                        child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: product_controller.Popularlist.value.length,
                            itemBuilder: (BuildContext context, int index) {

                              return Card_Popular(
                                popularseller: product_controller.Popularlist.value[index],
                              );

                          }
                        ),
                      ),

                      lists(
                        title: 'Trending now',
                        height: 100,
                        child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: product_controller.Trendinglist.value.length,
                            itemBuilder: (BuildContext context, int index) {

                              return Card_Trending(
                                trendingseller: product_controller.Trendinglist.value[index],
                              );

                            }
                        ),
                      ),

                      ],
                  ),
                ),
            ),

          ],
        ),
      )
    );
  }
}
