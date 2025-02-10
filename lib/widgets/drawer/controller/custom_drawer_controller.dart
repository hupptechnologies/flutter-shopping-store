import 'package:e_commerce/common/constant/image_constant.dart';
import 'package:e_commerce/routers/app_routers.dart';
import 'package:e_commerce/screens/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDrawerController extends GetxController {
  final HomeController homeController = Get.find<HomeController>();
  RxBool isDarkMode = false.obs;

  final List themes = [
    {
      "icon": Icons.light_mode_outlined,
      "selectedIcon": Icons.light_mode_rounded,
      "text": "Light",
      "isDark": false
    },
    {
      "icon": Icons.dark_mode_outlined,
      "selectedIcon": Icons.dark_mode_rounded,
      "text": "Dark",
      "isDark": true
    },
  ];

  final List navBarList = [
    {
      "icon": ImageConstant.homeIcon,
      "title": "HomePage",
      "index": 0,
    },
    {
      "icon": ImageConstant.searchIcon,
      "title": "Discover",
      "index": 1,
    },
    {
      "icon": ImageConstant.shoppingIcon,
      "title": "My Order",
      "index": 2,
    },
    {
      "icon": ImageConstant.profileIcon,
      "title": "My profile",
      "index": 3,
    },
  ];

  final List otherNavbarList = [
    {
      "icon": ImageConstant.settingIcon,
      "title": "Setting",
      "path": AppRoutes.appSetting,
    },
    {
      "icon": ImageConstant.supportIcon,
      "title": "Support",
      "path": AppRoutes.support,
    },
    {
      "icon": ImageConstant.aboutUsIcon,
      "title": "About us",
      "path": AppRoutes.aboutUs,
    }
  ];

  get currentRoute => ![
        AppRoutes.appSetting,
        AppRoutes.support,
        AppRoutes.aboutUs
      ].contains(Get.currentRoute);

  void toggleTheme(bool darkMode) {
    isDarkMode.value = darkMode;
  }
}
