import 'package:e_commerce/screens/auth/password/controller/password_controller.dart';
import 'package:get/get.dart';

class PasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PasswordController>(() => PasswordController());
  }
}
