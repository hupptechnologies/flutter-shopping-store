import 'package:e_commerce/screens/auth/forget-password/controller/forget_password_controller.dart';
import 'package:get/get.dart';

class ForgetPasswordBinging extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForgetPasswordController>(() => ForgetPasswordController());
  }
}
