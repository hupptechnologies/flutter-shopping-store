import 'package:e_commerce/common/constant/image_constant.dart';
import 'package:e_commerce/screens/home/controller/home_controller.dart';
import 'package:e_commerce/widgets/appbar/view/common_app_bar.dart';
import 'package:e_commerce/widgets/drawer/view/drawer_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: Obx(() => CommonAppBar(title: controller.currentTitle)),
        ),
        drawer: const CommonDrawerView(),
        drawerEnableOpenDragGesture: false,
        body: Obx(() => controller.currentScreen),
        bottomNavigationBar: _buildBottomNavigationBar(),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      height: 65,
      decoration: _bottomNavBarDecoration(),
      child: ClipRRect(
        borderRadius: _bottomNavBorderRadius,
        child: Obx(
          () => BottomNavigationBar(
            backgroundColor: Colors.white,
            currentIndex: controller.selectedIndex.value,
            onTap: controller.changeTabIndex,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.black.withOpacity(0.2),
            showSelectedLabels: false,
            showUnselectedLabels: false,
            iconSize: 26,
            items: _bottomNavItems(),
          ),
        ),
      ),
    );
  }

  BoxDecoration _bottomNavBarDecoration() => BoxDecoration(
        color: Colors.white,
        borderRadius: _bottomNavBorderRadius,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, -2),
          ),
        ],
      );

  final BorderRadius _bottomNavBorderRadius = const BorderRadius.only(
    topLeft: Radius.circular(25),
    topRight: Radius.circular(25),
  );

  List<BottomNavigationBarItem> _bottomNavItems() {
    return [
      _buildBottomNavItem(
        iconPath: ImageConstant.homeIcon,
        label: 'Home',
        index: 0,
      ),
      _buildBottomNavItem(
        iconPath: ImageConstant.searchIcon,
        label: 'Search',
        index: 1,
      ),
      _buildBottomNavItem(
        iconPath: ImageConstant.shoppingIcon,
        label: 'Cart',
        index: 2,
      ),
      _buildBottomNavItem(
        iconPath: ImageConstant.profileIcon,
        label: 'Profile',
        index: 3,
      ),
    ];
  }

  BottomNavigationBarItem _buildBottomNavItem({
    required String iconPath,
    required String label,
    required int index,
  }) {
    bool isSelected = controller.selectedIndex.value == index;
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(
        iconPath,
        width: 25,
        height: 25,
        color: isSelected ? Colors.black : Colors.black.withOpacity(0.2),
      ),
      label: label,
      backgroundColor: Colors.white,
    );
  }
}
