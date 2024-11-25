import 'package:e_commerce/screens/auth/verification-code/controller/verification_code_controller.dart';
import 'package:get/get.dart';

class VerificationCodeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VerificationCodeController>(() => VerificationCodeController());
  }
}
