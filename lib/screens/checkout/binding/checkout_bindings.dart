import 'package:get/get.dart';
import '../controller/checkout_controller.dart';

class CheckoutBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CheckoutController>(() => CheckoutController());
  }
}
