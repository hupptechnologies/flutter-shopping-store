import 'package:e_commerce/screens/home/controller/dashboard_controller.dart';
import 'package:e_commerce/screens/home/controller/home_controller.dart';
import 'package:e_commerce/screens/home/controller/profile_controller.dart';
import 'package:e_commerce/screens/home/controller/search_discover_controller.dart';
import 'package:e_commerce/screens/orders/controller/order_controller.dart';
import 'package:e_commerce/widgets/appbar/controller/appbar_controller.dart';
import 'package:e_commerce/widgets/drawer/controller/custom_drawer_controller.dart';
import 'package:e_commerce/widgets/drawer/controller/filter_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AppbarController>(() => AppbarController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<DashboardController>(() => DashboardController());
    Get.lazyPut<SearchDiscoverController>(() => SearchDiscoverController());
    Get.lazyPut<FilterController>(() => FilterController());
    Get.lazyPut<CustomDrawerController>(() => CustomDrawerController());
    Get.lazyPut<OrderController>(() => OrderController());
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}
