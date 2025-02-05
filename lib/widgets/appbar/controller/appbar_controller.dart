import 'package:e_commerce/routers/app_routers.dart';
import 'package:get/get.dart';

class AppbarController extends GetxController {
  late RxInt notificationCount = 0.obs;

  @override
  void onInit() {
    notificationCount.value = 5;
    super.onInit();
  }

  void gotoNotification() {
    Get.toNamed(AppRoutes.notification);
  }
}
