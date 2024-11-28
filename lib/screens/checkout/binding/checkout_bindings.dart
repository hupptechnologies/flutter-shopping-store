import 'package:e_commerce/screens/checkout/controller/payment_controller.dart';
import 'package:e_commerce/screens/checkout/controller/shipping_controller.dart';
import 'package:get/get.dart';
import '../controller/checkout_controller.dart';

class CheckoutBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CheckoutController>(() => CheckoutController());
    Get.lazyPut<ShippingController>(() => ShippingController());
    Get.lazyPut<PaymentController>(() => PaymentController());
  }
}
