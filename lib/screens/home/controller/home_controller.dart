import 'package:e_commerce/screens/home/view/dashboard_view.dart';
import 'package:e_commerce/screens/home/view/profile_view.dart';
import 'package:e_commerce/screens/home/view/search_discover.dart';
import 'package:e_commerce/screens/home/view/shoping_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  late RxInt selectedIndex = 0.obs;

  final List<Widget> screens = [
    const DashboardView(),
    const SearchDiscover(),
    const ShopingView(),
    const ProfileView(),
  ];

  final List<String> title = ['Gemstore', 'Discover', 'My Orders', 'Profile'];

  Widget get currentScreen => screens[selectedIndex.value];
  String get currentTitle => title[selectedIndex.value];

  void changeTabIndex(int index) {
    selectedIndex.value = index;
  }
}
