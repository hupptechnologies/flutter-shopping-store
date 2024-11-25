import 'package:get/get.dart';

class AppbarController extends GetxController {
  late RxInt notificationCount = 0.obs;

  @override
  void onInit() {
    notificationCount.value = 5;
    super.onInit();
  }
}
