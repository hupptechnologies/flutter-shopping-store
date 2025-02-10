import 'package:e_commerce/screens/appSetting/screens/notification/controller/setting_notification_controller.dart';
import 'package:get/get.dart';

class SettingNotificationBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingNotificationController>(
        () => SettingNotificationController());
  }
}
