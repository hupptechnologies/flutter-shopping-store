import 'package:e_commerce/data/address/address_dto.dart';
import 'package:get/get.dart';

class CheckoutController extends GetxController {
  final List<String> stepperTitle = ['Shipping', 'Payment', 'Order Completed'];

  late RxInt currentStep = 0.obs;

  final address = AddressDto().obs;
  var addressErrors = <String, String>{}.obs;
  late RxString selectedShippingMethod = 'free'.obs;
  late RxBool isBillingAddress = false.obs;

  bool get isContinuePayment => isBillingAddress.value && address.value.isValid;

  void validateField(String key, String value) {
    if (value.isEmpty) {
      addressErrors[key] = "Field is required";
    } else {
      addressErrors.remove(key);
    }
  }

  void addressFieldValidation(String key, String value, bool isRequired) {
    address.update((add) {
      add?.updateField(key, value);
    });
    if (isRequired) {
      validateField(key, value);
    }
  }

  void changeShippingMethod(String? value) {
    selectedShippingMethod.value = value!;
  }

  void changeBillingAddress(bool? value) {
    isBillingAddress.value = value ?? false;
  }

  void nextStep() {
    currentStep.value = currentStep.value + 1;
    print('object');
  }
}
