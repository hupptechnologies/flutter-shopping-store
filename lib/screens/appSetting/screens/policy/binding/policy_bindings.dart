import 'package:e_commerce/screens/appSetting/screens/policy/controller/policy_controller.dart';
import 'package:get/get.dart';

class PolicyBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PolicyController>(() => PolicyController());
  }
}
