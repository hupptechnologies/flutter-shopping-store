import 'package:get/get.dart';

class CheckoutController extends GetxController {
  final List<String> stepperTitle = ['Shipping', 'Payment', 'Order Completed'];

  late RxInt currentStep = 0.obs;

  void nextStep() {
    currentStep.value = currentStep.value + 1;
  }
}
