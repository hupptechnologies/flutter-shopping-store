import 'package:e_commerce/screens/appSetting/controller/app_setting_controller.dart';
import 'package:get/get.dart';

class AppSettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AppSettingController>(() => AppSettingController());
  }
}
