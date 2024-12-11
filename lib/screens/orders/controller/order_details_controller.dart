import 'package:e_commerce/routers/app_routers.dart';
import 'package:get/get.dart';

class OrderDetailsController extends GetxController {
  final items = [
    {'name': 'Maxi Dress', 'quantity': 'x1', 'price': '\$68.00'},
    {'name': 'Linen Dress', 'quantity': 'x1', 'price': '\$52.00'},
  ];

  void returnHomePage() {
    Get.toNamed(AppRoutes.home);
  }

  void ratePage() {
    Get.toNamed(AppRoutes.home);
  }
}
