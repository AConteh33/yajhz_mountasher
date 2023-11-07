import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../model/category.dart';
import '../model/popular_sellers.dart';
import '../model/trending_seller.dart';
import '../service/remote_service.dart';

class Product_Controller extends GetxController{

  var Popularlist = RxList<PopularSeller>().obs;

  var Trendinglist = RxList<TrendingSeller>().obs;

  var Categorylist = RxList<Category>().obs;

  static var client = http.Client();

  @override
  void onInit() {
    fetchPupolar_sellers();
    fetchtrending_sellers();
    fetchcayegory();
    super.onInit();
  }

  void fetchPupolar_sellers() async {

    // Data isn't receiving anything so i added artificial data
    Popularlist.value.add(
        PopularSeller(lat: 0.0, lng: 0.0, filter: 1, name: '')
    );

    try {
      // isLoading(true);
      var products = await RemoteServices.fetchPupolar_sellers();
      if (products != null) {
        Popularlist.value = products.obs;
      }
    } finally {
      // isLoading(false);
    }
  }

  void fetchtrending_sellers() async {

    // Data isn't receiving anything so i added artificial data
    Trendinglist.value.add(
        TrendingSeller(
            lat: 0.0, lng: 0.0, filter: 1, name: ''
        ),
    );

    try {
      // isLoading(true);

      var products = await RemoteServices.fetchTrending_sellers();

      if (products != null) {
        Trendinglist.value = products.obs;
      }

    } finally {
      // isLoading(false);
    }
  }

  void fetchcayegory() async {

    // Data isn't receiving anything so i added artificial data
    Categorylist.value.add(
      Category(
            image: ''
        ),
    );

    try {
      // isLoading(true);

      var products = await RemoteServices.getcategory();

      if (products != null) {
        Categorylist.value = products.obs;
      }

    } finally {
      // isLoading(false);
    }
  }

}