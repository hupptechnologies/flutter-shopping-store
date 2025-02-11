import 'package:e_commerce/common/constant/image_constant.dart';
import 'package:e_commerce/routers/app_routers.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class PaymentController extends GetxController {
  final List<Map<String, dynamic>> paymentMethodCart = [
    {
      "icon": ImageConstant.moneyIcon,
      "label": "Cash",
    },
    {
      "icon": ImageConstant.creditCardIcon,
      "label": "Credit Card",
    },
    {
      "icon": ImageConstant.dot3Icon,
    },
  ];

  final List<String> creditCardList = [
    ImageConstant.payPalIcon,
    ImageConstant.visaIcon,
    ImageConstant.mastercardIcon,
    ImageConstant.alipayIcon,
    ImageConstant.amexIcon,
  ];

  late RxInt selectPaymentMethod = 1.obs;
  late RxBool isTermsAndCondition = false.obs;
  late RxInt price = 100.obs;

  void changePaymentMethod(int index) {
    selectPaymentMethod.value = index;
  }

  void toggleTermsAndCondition(bool? value) {
    isTermsAndCondition.value = value ?? false;
  }

  void addCreditCard() {
    Get.toNamed(AppRoutes.addPayment);
  }

  void termsAndConditions() {
    if (kDebugMode) {
      print('Terms and Conditions');
    }
  }
}
