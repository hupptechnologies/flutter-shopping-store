import 'package:e_commerce/common/constant/image_constant.dart';
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

  late RxInt selectPaymentMethod = 1.obs;

  void changePaymentMethod(int index) {
    selectPaymentMethod.value = index;
  }
}
