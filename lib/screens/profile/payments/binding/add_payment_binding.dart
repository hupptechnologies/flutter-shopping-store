import 'package:e_commerce/screens/profile/payments/controller/add_payment_controller.dart';
import 'package:get/get.dart';

class AddPaymentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddPaymentController>(() => AddPaymentController());
  }
}
