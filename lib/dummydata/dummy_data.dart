import 'dart:convert';

import 'package:e_commerce/common/constant/image_constant.dart';

abstract class DummyData {
  static final String productList = jsonEncode([
    {
      'id': 1,
      'name': 'Turtleneck Sweater',
      'price': 1750.00,
      'discountPrice': 1150.00,
      'rating': 4.5,
      'image': ImageConstant.category1,
    },
    {
      'id': 2,
      'name': 'Long Sleeve Dress',
      'price': 2500.00,
      'discountPrice': 2300.00,
      'rating': 5,
      'image': ImageConstant.category2,
    },
    {
      'id': 3,
      'name': 'Sportwear Set',
      'price': 1500.00,
      'discountPrice': 1200.00,
      'rating': 4,
      'image': ImageConstant.category3,
    },
    {
      'id': 4,
      'name': 'Elegant Dress',
      'price': 1000.00,
      'discountPrice': 800.00,
      'rating': 4,
      'image': ImageConstant.category4,
    },
    {
      'id': 5,
      'name': 'Sweater',
      'price': 100.2,
      'discountPrice': 50.00,
      'rating': 3,
      'image': ImageConstant.category1,
    },
    {
      'id': 6,
      'name': 'Long Sleeve',
      'price': 700.00,
      'discountPrice': 579.00,
      'rating': 5,
      'image': ImageConstant.category2,
    },
    {
      'id': 7,
      'name': 'Sportwear',
      'price': 499.00,
      'discountPrice': 399.00,
      'rating': 4,
      'image': ImageConstant.category3,
    },
    {
      'id': 8,
      'name': 'Dress',
      'price': 500.00,
      'discountPrice': 200.00,
      'rating': 4.5,
      'image': ImageConstant.category4,
    },
    {
      'id': 9,
      'name': 'Turtleneck',
      'price': 105.2,
      'discountPrice': 88.5,
      'rating': 3.5,
      'image': ImageConstant.category2,
    }
  ]);
}
