import 'package:e_commerce/screens/support/controller/support_controller.dart';
import 'package:get/get.dart';

class SupportBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SupportController>(() => SupportController());
  }
}
