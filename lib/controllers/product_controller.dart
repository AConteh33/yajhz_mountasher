import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../model/category.dart';
import '../model/popular_sellers.dart';
import '../model/trending_seller.dart';
import '../service/remote_service.dart';

class Product_Controller extends GetxController{

  PopularSeller Popularlist = PopularSeller(
      success: true,
      responseCode: 0,
      message: '',
      data: []
  );

  TrendingSeller Trendinglist = TrendingSeller(
      success: true,
      responseCode: 0,
      message: '',
      data: [],
  );

  MainCategory Categorylist = MainCategory(
      success: true,
      responseCode: 0,
      message: '',
      data: [],
      cartCount: 0,
  );

  static var client = http.Client();

  @override
  void onInit() {
    fetchPupolar_sellers();
    fetchtrending_sellers();
    fetchcayegory();
    super.onInit();
  }

  void fetchPupolar_sellers() async {

    try {
      // isLoading(true);
      var products = await RemoteServices.fetchPupolar_sellers();
      if (products != null) {
        Popularlist = products;
      }

    } finally {
      // isLoading(false);
    }
    update();
  }

  void fetchtrending_sellers() async {

    try {
      // isLoading(true);

      TrendingSeller? products = await RemoteServices.fetchTrending_sellers();

      if (products != null) {
        Trendinglist = products;
      }

    } finally {
      // isLoading(false);
    }
    update();
  }

  void fetchcayegory() async {

    try {
      // isLoading(true);

      var products = await RemoteServices.getcategory();

      if (products != null) {
        print('it\'s not null');
        Categorylist = products;
      }else{
        print('its null');
      }

    } finally {
      // isLoading(false);
    }
    update();
  }

}