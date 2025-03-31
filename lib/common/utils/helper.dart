import 'package:e_commerce/common/constant/image_constant.dart';
import 'package:flutter/material.dart';

class Helper {
  static T enumFromString<T>(String value, List<T> enumValues) {
    return enumValues.firstWhere(
      (e) => e.toString().split('.').last.toLowerCase() == value.toLowerCase(),
      orElse: () => throw Exception("Invalid enum value: $value"),
    );
  }

  static ImageProvider getImageProvider(String? imageUrl) {
    if (imageUrl != null && imageUrl.isNotEmpty) {
      return NetworkImage(imageUrl);
    } else {
      return const AssetImage(ImageConstant.empty);
    }
  }
}
